# imports
import re
from django.core.exceptions import PermissionDenied
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from django.shortcuts import render, redirect
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.db import connection
from .forms import MovieForm, ProductForm, SessionForm, CommentForm, UserForm
from .models import *
from django.contrib.auth import get_user_model
from validate_email import validate_email
from django.contrib.sites.shortcuts import get_current_site
from django.template.loader import render_to_string
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.utils.encoding import force_str, force_text, force_bytes, DjangoUnicodeDecodeError
from .utils import generate_token
from django.core.mail import EmailMessage
from django.conf import settings
from .filters import PeliculesFilter


# Create your views here.

# Funció per restringir les pàgines que només siguin visibles per l'admin
def superuser_only(function):
    """Limit view to superusers only."""

    def _inner(request, *args, **kwargs):
        if not request.user.is_superuser:
            raise PermissionDenied

        return function(request, *args, **kwargs)

    return _inner


# activar el compte de l'usuari
def activate_user(request, uidb64, token):
    try:
        uid = force_text(urlsafe_base64_decode(uidb64))
        user = Usuari.objects.get(pk=uid)

    except Exception as e:
        user = None

    if user and generate_token.check_token(user, token):
        user.is_email_verified = True
        user.save()

        messages.success(request, "Has verificat el correu, pots iniciar sessió")
        return redirect(to='/login')

    return render(request, 'activar_compte_fail.html')


# funció per enviar un correu per activar el compte
def send_email(user, request):
    current_site = get_current_site(request)
    email_subject = 'Activa el teu compte'
    email_body = render_to_string('activar_compte.html', {
        'user': user,
        'domain': current_site,
        'uid': urlsafe_base64_encode(force_bytes(user.pk)),
        'token': generate_token.make_token(user)
    })

    email = EmailMessage(subject=email_subject, body=email_body, from_email=settings.EMAIL_FROM_USER,
                         to=[user.email]
                         )
    email.send()



# funció per registrar un usuari
def register_view(request):
    if request.method == 'POST':

        context = {
            'has_error': False,
            'data': request.POST
        }
        email = request.POST.get('email')
        username = request.POST.get('username')
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        password1 = request.POST.get('password1')
        password2 = request.POST.get('password2')

        # si el nom d'usuari té símbols
        if re.search(r"[ !#$%&'()*+,-./[\\\]^_`{|}~<>" + r'"]', username):
            messages.add_message(request, messages.ERROR, 'El nombre de usuario no puede tener símbolos')
            context['has_error'] = True

        # si el nom té símbols
        if re.search(r"[ !#$%&'()*+,-./[\\\]^_`{|}~<>" + r'"]', first_name):
            messages.add_message(request, messages.ERROR, 'El nombre no puede tener símbolos')
            context['has_error'] = True

        # si el cognom te símbols
        if re.search(r"[ !#$%&'()*+,-./[\\\]^_`{|}~<>" + r'"]', last_name):
            messages.add_message(request, messages.ERROR, 'El apellido no puede tener símbolos')
            context['has_error'] = True

        # si la contrasenya té menys de 8 caràcters
        if len(password1) < 8:
            messages.add_message(request, messages.ERROR, 'La contraseña debe tener al menos 8 carácteres')
            context['has_error'] = True

        # si la contrasenya no té majúscules
        if re.search(r"[A-Z]", password1) is None:
            messages.add_message(request, messages.ERROR, 'La contraseña debe contener mayúsculas')
            context['has_error'] = True

        # si la contrasenya no té símbols
        if re.search(r"[ !#$%&'()*+,-./[\\\]^_`{|}~" + r'"]', password1) is None:
            messages.add_message(request, messages.ERROR, 'La contraseña debe contener símbolos')
            context['has_error'] = True

        # si les contrasenyes no coincideixen
        if password1 != password2:
            messages.add_message(request, messages.ERROR, 'Las contraseñas no coinciden')
            context['has_error'] = True

        # si l'email és vàlid
        if not validate_email(email):
            messages.add_message(request, messages.ERROR, 'Introduce un email válido')
            context['has_error'] = True

        # si l'email ja existeix
        if Usuari.objects.filter(email=email).exists():
            messages.add_message(request, messages.ERROR, 'El correo introducido ya existe')
            context['has_error'] = True

        if context['has_error']:
            return render(request, "registrar.html", context)

        user = Usuari.objects.create_user(email=email, username=username, first_name=first_name, last_name=last_name)
        user.set_password(password1)
        user.save()

        send_email(user, request)

        messages.add_message(request, messages.SUCCESS, "T'hem enviat un correu per verificar el teu compte")
        return redirect(to='/login')

    return render(request, "registrar.html")


# Funció per iniciar sessió a la pàgina
User = get_user_model()
def login_view(request):
    # Si s'envia pel mètode post autentifiquem a l'usuari
    if request.method == 'POST':
        email = request.POST.get('email')
        password = request.POST.get('password')

        user = authenticate(request, email=email, password=password)

        # Primer comprovem si l'usuari esta a la base de dades.
        # Després mirem si té el compte verificat. Si no el té no el deixarem passar del login
        # Després comprovem si és admin. Si ho és el redirigim al seu 'dashboard'.
        # Si és un usuari normal el redirigim a la cartellera
        if user is not None:
            if not (user.is_email_verified):
                messages.error(request, "Falta verificar el compte, t'hem enviat un correu per verificar-lo")
                return redirect("/login")

            superusers = User.objects.get(email=email)
            if superusers.is_superuser == True:
                login(request, user)
                return redirect("/llistat_pelicules")

            elif user is not None:
                login(request, user)
                return redirect("/")

        else:
            messages.error(request, 'Correu o contrasenya incorrecta')

    context = {'data': request.POST}

    return render(request, "login.html", context)


# Funció per tancar sessió
def logOut_view(request):
    logout(request)
    return redirect('login')




##
# Pel·lícules
#

# Funció per mostrar les pel·lícules a la cartellera
def all_movies(request):
    pelicules = Pelicula.objects.all()
    generes = Generes.objects.all()

    myFilter = PeliculesFilter(request.GET, queryset=pelicules)
    pelicules = myFilter.qs

    # L' String és el nom de la variable que haig d'usar a la template
    context = {
        'pelicules': pelicules,
        'generes': generes,
        'myFilter': myFilter
    }

    return render(request, "index.html", context)


# cridem al decorador per restringir la pàgina si no ets admin
@superuser_only
# Funció per mostrar el llistat de pel·lícules a la pàgina de l'admin perquè les pugui gestionar
def all_movies_admin(request):
    pelicules = Pelicula.objects.all()

    # L' String és el nom de la variable que haig d'usar a la template
    context = {
        'pelicules': pelicules
    }

    return render(request, "llistat_pelis_admin.html", context)


# Funció per afegir una pel·lícula
@superuser_only
def add_movie(request):
    form = MovieForm()

    if request.method == 'POST':
        form = MovieForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect(to="llistat_pelicules")

            # messages.success(request, "La pel·lícula s'ha afegit correctament")

        else:
            # messages.error(request, "S'ha produit un error")
            print(form.errors)

    context = {
        'form': form
    }

    return render(request, "afegir_pelicula.html", context)


# Funció per editar una pel·lícula
@superuser_only
def edit_movie(request, id):
    pelicula = Pelicula.objects.get(id_pelicula=id)
    form = MovieForm(instance=pelicula)

    if request.method == 'POST':
        form = MovieForm(request.POST, request.FILES, instance=pelicula)

        if form.is_valid():
            form.save()
            # context['form'] = form

            return redirect(to="llistat_pelicules")
            # messages.success(request, "La pel·lícula s'ha modificat correctament")

        else:
            # messages.error(request, "S'ha produit un error")
            print(form.errors)

    # L' String és el nom de la variable que haig d'usar a la template
    context = {
        'form': form
    }

    return render(request, "editar_pelicula.html", context)


# Funció per eliminar una pel·lícula
@superuser_only
def delete_movie(request, id):
    pelicula = Pelicula.objects.get(id_pelicula=id)
    pelicula.delete()

    return redirect(to="llistat_pelicules")


# Funció per veure la informació d'una pel·lícula i els comentaris de cada una
def movie_details(request, id):
    pelicula = Pelicula.objects.get(id_pelicula=id)
    comentaris = Comentari.objects.filter(id_pelicula=pelicula).order_by('-data')

    sessio = Sessio.objects.raw("SELECT s.*"
                                " FROM gestio_cine_sessio s"
                                " INNER JOIN gestio_cine_pelicula p ON s.id_pelicula_id = p.id_pelicula"
                                " WHERE p.id_pelicula = " + id)

    # L' String és el nom de la variable que haig d'usar a la template
    context = {
        'pelicula': pelicula,
        'sessio': sessio,
        'comentaris': comentaris
    }

    return render(request, "info_pelicula.html", context)


##
# Butaques
#

# Cridem al decorador perquè redirigeixi a la pantalla de login si no està logat
@login_required(login_url='/login/')
# Funció per mostrar la pàgina per les butaques
def seleccio_butaca(request, id):
    sessio = Sessio.objects.get(id_sessio=id)

    # funció per agafar totes les butaques
    butaca = Pelicula.objects.raw("SELECT b.*, sal.*, ses.*, f.*, p.*"
                                  " FROM gestio_cine_sala sal"
                                  " INNER JOIN gestio_cine_sessio ses ON sal.id_sala = ses.id_sala_id"
                                  " INNER JOIN gestio_cine_fila f ON sal.id_sala = f.id_sala_id"
                                  " INNER JOIN gestio_cine_butaca b ON f.id_fila = b.id_fila_id"
                                  " INNER JOIN gestio_cine_pelicula p ON ses.id_pelicula_id = p.id_pelicula"
                                  " WHERE ses.id_sessio = " + id)

    # funció per agafar totes les butaques ocupades
    # butaques_ocupades = Pelicula.objects.raw("SELECT b.*, sal.*, ses.*, f.*, p.*"
    #                                          " FROM gestio_cine_sala sal"
    #                                          " INNER JOIN gestio_cine_sessio ses ON sal.id_sala = ses.id_sala_id"
    #                                          " INNER JOIN gestio_cine_fila f ON sal.id_sala = f.id_sala_id"
    #                                          " INNER JOIN gestio_cine_butaca b ON f.id_fila = b.id_fila_id"
    #                                          " INNER JOIN gestio_cine_pelicula p ON ses.id_pelicula_id = p.id_pelicula"
    #                                          " INNER JOIN gestio_cine_butaca_reserves br ON b.id_butaca = br.id_butaca_id"
    #                                          " WHERE ses.id_sessio = " + id)

    butaques_ocupades = Pelicula.objects.raw("SELECT br.*, b.*, p.id_pelicula "
                                             " FROM gestio_cine_butaca_reserves br"
                                             " INNER JOIN gestio_cine_butaca b ON br.id_butaca_id = b.id_butaca"
                                             " INNER JOIN gestio_cine_sessio ses ON br.id_sessio_id = ses.id_sessio"
                                             " INNER JOIN gestio_cine_reserva r ON br.id_reserva_id = r.id_reserva"
                                             " INNER JOIN gestio_cine_pelicula p ON ses.id_pelicula_id = p.id_pelicula"
                                             " WHERE br.id_sessio_id = " + id)

    context = {
        'sessio': sessio,
        'butaca': butaca,
        'butaques_ocupades': butaques_ocupades,
    }

    print(butaques_ocupades)

    return render(request, "seleccio_butaques.html", context)


# Funció per reservar la butaca
@login_required(login_url='/login/')
def reservar_butaca(request, id):
    if request.method == 'POST':
        sessio = Sessio.objects.get(id_sessio=id)
        butaca = request.POST['butaca']

        # guardem el valor de la butaca seleccionada
        request.session['butaca'] = butaca
        print(butaca, sessio)

        # fer l'insert a la taula reserves
        add_reserva = Reserva.objects.create(id_sessio=sessio)
        add_reserva.save()

        # agafem l'id del registre que acabem d'insertar
        id_reserva_taula_butaca_reserves = add_reserva.id_reserva

        # agafem l'id de la butaca
        butaca_per_reservar = Butaca.objects.get(id_butaca=butaca)

        # agafem l'id de reserves
        reserva_per_reservar = Reserva.objects.get(id_reserva=id_reserva_taula_butaca_reserves)

        # fem l'insert a la taula butaques_reserves amb les ids obtingudes
        add_butaca_reserves = Butaca_Reserves.objects.create(id_butaca=butaca_per_reservar,
                                                             id_reserva=reserva_per_reservar,
                                                             id_sessio=sessio)
        add_butaca_reserves.save()

        return redirect(to='/formulari_pagament')


# Pàgina pagament
def formulari_pagament(request):
    # agafem el valor de la butaca seleccionada
    butaca = request.session['butaca']
    butaca = int(butaca) - 48
    productes = Producte.objects.all()

    # L' String és el nom de la variable que haig d'usar a la template
    context = {
        'butaca': butaca,
        'productes': productes
    }

    return render(request, "formulari_pagament.html", context)



def updateItem(request):
    return JsonResponse('item was added', safe=False)




##
# Funcions per productes
##

# Funció per mostrar tots els productes
def all_productes(request):
    productes = Producte.objects.all()

    # L' String és el nom de la variable que haig d'usar a la template
    context = {
        'productes': productes
    }

    return render(request, "productes.html", context)


# Funció per mostrar el llistat de tots els productes al panell de l'admin
@superuser_only
def all_productes_admin(request):
    productes = Producte.objects.all()

    # L' String és el nom de la variable que haig d'usar a la template
    context = {
        'productes': productes
    }

    return render(request, "llistat_productes_admin.html", context)


# Funció per afegir productes
@superuser_only
def add_producte(request):
    form = ProductForm()

    if request.method == 'POST':
        form = ProductForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()

            return redirect(to="llistat_productes")
            # messages.success(request, "El producte s'ha afegit correctament")

        else:
            print(form.errors)

    else:
        messages.error(request, "S'ha produit un error")

    context = {
        'form': form
    }

    return render(request, "afegir_producte.html", context)


# Funció per editar productes
@superuser_only
def edit_producte(request, id):
    producte = Producte.objects.get(id_producte=id)
    form = ProductForm(instance=producte)

    if request.method == 'POST':
        form = ProductForm(request.POST, request.FILES, instance=producte)

        if form.is_valid():
            form.save()
            # context['form'] = form

            return redirect(to="llistat_productes")

            # messages.success(request, "El producte s'ha modificat correctament")

        else:
            print(form.errors)

    # L' String és el nom de la variable que haig d'usar a la template
    context = {
        'form': form
    }

    return render(request, "editar_producte.html", context)


# Funció per esborrar productes
@superuser_only
def delete_producte(request, id):
    producte = Producte.objects.get(id_producte=id)
    producte.delete()

    return redirect(to="llistat_productes")


##
# Funcions sessions
##

# cridem al decorador per restringir la pàgina si no ets admin
@superuser_only
# Funció per mostrar el llistat de les sessions de les pel·lícules a la pàgina de l'admin perquè les pugui gestionar
def all_sessions_admin(request):
    sessions = Sessio.objects.all()

    # L' String és el nom de la variable que haig d'usar a la template
    context = {
        'sessions': sessions
    }

    return render(request, "llistat_sessions_admin.html", context)


@superuser_only
# Funció per afegir una sessió
def add_sessio(request):
    form = SessionForm()

    if request.method == 'POST':
        form = SessionForm(request.POST, request.FILES)

        if form.is_valid():
            form.save()

            return redirect(to="llistat_sessions")

            # messages.success(request, "La sessió s'ha afegit correctament")
        else:
            print(form.errors)

    context = {
        'form': form
    }

    return render(request, "afegir_sessio.html", context)


@superuser_only
# Funció per editar una sessió
def edit_sessio(request, id):
    sessio = Sessio.objects.get(id_sessio=id)
    form = SessionForm(instance=sessio)

    if request.method == 'POST':
        form = SessionForm(data=request.POST, instance=sessio)

        if form.is_valid():
            form.save()
            # context['form'] = form

            return redirect(to="llistat_sessions")
            # messages.success(request, "La sessio s'ha modificat correctament")

        else:
            print(form.errors)

    # L' String és el nom de la variable que haig d'usar a la template
    context = {
        'form': form
    }

    return render(request, "editar_sessio.html", context)


@superuser_only
# Funció per esborrar una sessió
def delete_sessio(request, id):
    sessio = Sessio.objects.get(id_sessio=id)
    sessio.delete()

    return redirect(to="llistat_sessions")


##
# Comentaris
#

# Funció per publicar un comentari
@login_required(login_url='/login/')
def public_comment(request, id):
    pelicula = Pelicula.objects.get(id_pelicula=id)
    usuari = request.user
    print(usuari)

    if request.method == 'POST':
        form = CommentForm(request.POST)

        if form.is_valid():

            comment = form.save(commit=False)
            comment.id_usuari = usuari
            comment.id_pelicula = pelicula
            comment.data = date.today()

            comment.save()

            # retornem a la pàgina on erem
            return redirect(to='/info_pelicula/' + str(pelicula.id_pelicula))

            # messages.success(request, "El comentari s'ha afegit correctament")

        else:
            messages.error(request, "S'ha produit un error")

    context = {
        'form': CommentForm()
    }

    return render(request, "afegir_comentari.html", context)


# cridem al decorador per restringir la pàgina si no ets admin
@superuser_only
# Funció per mostrar el llistat dels comentaris a la pàgina de l'admin perquè les pugui gestionar
def all_comments_admin(request):
    comentaris = Comentari.objects.order_by('-data')

    # L' String és el nom de la variable que haig d'usar a la template
    context = {
        'comentaris': comentaris
    }

    return render(request, "llistat_comentaris.html", context)


@superuser_only
# Funció per esborrar un comentari
def delete_comment(request, id):
    comentari = Comentari.objects.get(id_comentari=id)
    comentari.delete()

    return redirect(to="llistat_comentaris")
