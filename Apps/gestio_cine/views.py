# imports
from django.core.exceptions import PermissionDenied
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from .forms import SignUpForm, MovieForm, ProductForm, SessionForm, CommentForm
from .models import *

# Create your views here.

# Funció per restringir les pàgines que només siguin visibles per l'admin
def superuser_only(function):
    """Limit view to superusers only."""
    def _inner(request, *args, **kwargs):
        if not request.user.is_superuser:
            raise PermissionDenied

        return function(request, *args, **kwargs)
    return _inner





# Funció per registrar-se a la pàgina
def register_view(request):

    form = SignUpForm()

    # Si s'envia pel mètode post guardem el formulari
    if request.method == 'POST':
        form = SignUpForm(request.POST)
        if form.is_valid():
            form.save()

            # agafem el nom de l'usuari
            user = form.cleaned_data.get('username')
            messages.success(request, "Compte de l'usuari " + user + " creada amb èxit")
            return redirect("/login")

    context = {'form': form}
    return render(request, "registrar.html", context)


# Funció per iniciar sessió a la pàgina
def login_view(request):

    # Si s'envia pel mètode post autentifiquem a l'usuari
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        user = authenticate(request, username=username, password=password)

        # Si l'usuari està a la base de dades comprovem si és admin. Si ho és
        # el redirigim al seu 'dashboard'. Si és un usuari normal el redirigim
        # a la cartellera
        if user is not None:
            superusers = User.objects.get(username=username)
            if superusers.is_superuser == True:
                login(request, user)
                return redirect("/llistat_pelicules")

            elif user is not None:
                login(request, user)
                return redirect("/")

        else:
            messages.error(request, 'Correu o contrasenya incorrecta')

    context = {}

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

    # L' String és el nom de la variable que haig d'usar a la template
    context = {
        'pelicules': pelicules,
        'generes': generes
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

    if request.method == 'POST':
        form = MovieForm(request.POST, request.FILES)

        if form.is_valid():
            form.save()

            messages.success(request, "La pel·lícula s'ha afegit correctament")


        else:
            messages.error(request, "S'ha produit un error, revisa els camps")
            print(form.errors)

    context = {
        'form': MovieForm()
    }

    return render(request, "afegir_pelicula.html", context)



# Funció per editar una pel·lícula
@superuser_only
def edit_movie(request, id):

    pelicula = Pelicula.objects.get(id_pelicula=id)

    # L' String és el nom de la variable que haig d'usar a la template
    context = {
        'form': MovieForm(instance=pelicula)
    }

    if request.method == 'POST':
        form = MovieForm(request.POST, request.FILES, instance=pelicula)

        if form.is_valid():
            form.save()
            context['form'] = form
            messages.success(request, "La pel·lícula s'ha modificat correctament")

        else:
            messages.error(request, "S'ha produit un error, revisa els camps")
            print(form.errors)

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
    comentaris = Comentari.objects.filter(id_pelicula=pelicula)

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

    # Busquem les butaques per id de sessió
    butaca = Pelicula.objects.raw("SELECT b.*, sal.*, ses.*, f.*, p.*"
                                  " FROM gestio_cine_sala sal"
                                  " INNER JOIN gestio_cine_sessio ses ON sal.id_sala = ses.id_sala_id"
                                  " INNER JOIN gestio_cine_fila f ON sal.id_sala = f.id_sala_id"
                                  " INNER JOIN gestio_cine_butaca b ON f.id_fila = b.id_fila_id"
                                  " INNER JOIN gestio_cine_pelicula p ON ses.id_pelicula_id = p.id_pelicula"
                                  " WHERE ses.id_sessio = " + id)


    # Busquem les butaques ocupades per id de sessió
    butaques_ocupades = Pelicula.objects.raw("SELECT b.*, sal.*, ses.*, f.*, p.*"
                                             " FROM gestio_cine_sala sal"
                                             " INNER JOIN gestio_cine_sessio ses ON sal.id_sala = ses.id_sala_id"
                                             " INNER JOIN gestio_cine_fila f ON sal.id_sala = f.id_sala_id"
                                             " INNER JOIN gestio_cine_butaca b ON f.id_fila = b.id_fila_id"
                                             " INNER JOIN gestio_cine_pelicula p ON ses.id_pelicula_id = p.id_pelicula"
                                             " INNER JOIN gestio_cine_butaca_reserves br ON b.id_butaca = br.id_butaca_id"
                                             " WHERE ses.id_sessio = " + id)


    context = {
        'sessio': sessio,
        'butaca': butaca,
        'butaques_ocupades': butaques_ocupades,
    }

    return render(request, "seleccio_butaques.html", context)



# Funció per reservar la butaca
@login_required(login_url='/login/')
def reservar_butaca(request, id):

    if request.method == 'POST':
        sessio = Sessio.objects.get(id_sessio=id)
        butaca = request.POST['butaca']
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
        add_butaca_reserves = Butaca_Reserves.objects.create(id_butaca=butaca_per_reservar, id_reserva=reserva_per_reservar)
        add_butaca_reserves.save()

        return redirect(to='/formulari_pagament')



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

    if request.method == 'POST':
        form = ProductForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()

            messages.success(request, "El producte s'ha afegit correctament")

    context = {
        'form': ProductForm()
    }

    return render(request, "afegir_producte.html", context)



# Funció per editar productes
@superuser_only
def edit_producte(request, id):

    producte = Producte.objects.get(id_producte=id)

    # L' String és el nom de la variable que haig d'usar a la template
    context = {
        'form': ProductForm(instance=producte)
    }

    if request.method == 'POST':
        form = ProductForm(request.POST, request.FILES, instance=producte)

        if form.is_valid():
            form.save()
            context['form'] = form
            messages.success(request, "El producte s'ha modificat correctament")

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

    if request.method == 'POST':
        form = SessionForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()

            messages.success(request, "La sessió s'ha afegit correctament")

    context = {
        'form': SessionForm()
    }

    return render(request, "afegir_sessio.html", context)



@superuser_only
# Funció per editar una sessió
def edit_sessio(request, id):

    sessio = Sessio.objects.get(id_sessio=id)

    # L' String és el nom de la variable que haig d'usar a la template
    context = {
        'form': SessionForm(instance=sessio)
    }

    if request.method == 'POST':
        form = SessionForm(data=request.POST, instance=sessio)

        if form.is_valid():
            form.save()
            context['form'] = form
            messages.success(request, "La sessio s'ha modificat correctament")

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

    if request.method == 'POST':
        form = CommentForm(request.POST)

        if form.is_valid():

            comment = form.save(commit=False)
            comment.id_usuari = usuari
            comment.id_pelicula = pelicula
            comment.data = date.today()

            comment.save()

            messages.success(request, "El comentari s'ha afegit correctament")

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

    comentaris = Comentari.objects.all()

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




# Pàgina pagament
def formulari_pagament(request):

    pelicula = Pelicula.objects.all()

    # L' String és el nom de la variable que haig d'usar a la template
    context = {
        'pelicula': pelicula
    }

    return render(request, "formulari_pagament.html", context)




