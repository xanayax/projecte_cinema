from django.core.exceptions import PermissionDenied
from django.shortcuts import render, redirect
from .models import *
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from .forms import SignUpForm, MovieForm, ProductForm

# Create your views here.

# Funció per restringir les pàgines que només siguin visibles per l'admin
def superuser_only(function):
    """Limit view to superusers only."""
    def _inner(request, *args, **kwargs):
        if not request.user.is_superuser:
            raise PermissionDenied

        return function(request, *args, **kwargs)
    return _inner


# Funció per retornar la pàgina índex al obrir la web
def homeView(request):
    return render(request, "index.html")



# Funció per registrar-se a la pàgina
def registerView(request):

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
def loginView(request):
    # Si s'envia pel mètode post autentifiquem a l'usuari
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        user = authenticate(request, username=username, password=password)

        # Si l'usuari està a la base de dades comprovem si és admin. Si ho és
        # el redirigim al seu 'dashboard'. Si és un usuari normal el redirigim
        # a l'index
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
def logOutView(request):

    logout(request)
    return redirect('login')


# Funció per mostrar les pel·lícules a la cartellera
def allMovies(request):

    pelicules = Pelicula.objects.all()

    # L' String és el nom de la variable que haig d'usar a la template
    context = {
        'pelicules': pelicules
    }

    return render(request, "cartellera.html", context)


# cridem al decorador per restringir la pàgina si no ets admin
@superuser_only
# Funció per mostrar el llistat de pel·lícules a la pàgina de l'admin perquè les pugui gestionar
def allMoviesAdmin(request):

    pelicules = Pelicula.objects.all()

    # L' String és el nom de la variable que haig d'usar a la template
    context = {
        'pelicules': pelicules
    }

    return render(request, "llistat_pelis_admin.html", context)



@superuser_only

# Funció per afegir una pel·lícula
def addMovie(request):

    if request.method == 'POST':
        form = MovieForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()

            messages.success(request, "La pel·lícula s'ha afegit correctament")
            return redirect("/llistat_pelicules")

    context = {
        'form': MovieForm()
    }

    return render(request, "afegir_pelicula.html", context)



@superuser_only
def editMovie(request, id):

    pelicula = Pelicula.objects.get(id_pelicula=id)

    # L' String és el nom de la variable que haig d'usar a la template
    context = {
        'form': MovieForm(instance=pelicula)
    }

    if request.method == 'POST':
        form = MovieForm(data=request.POST, instance=pelicula)

        if form.is_valid():
            form.save()
            context['form'] = form
            messages.success(request, "La pel·lícula s'ha modificat correctament")

    return render(request, "editar_pelicula.html", context)


@superuser_only
def deleteMovie(request, id):

    pelicula = Pelicula.objects.get(id_pelicula=id)
    pelicula.delete()

    return redirect(to="llistat_pelicules")



def allProductes(request):

    productes = Producte.objects.all()

    # L' String és el nom de la variable que haig d'usar a la template
    context = {
        'productes': productes
    }

    return render(request, "productes.html", context)


@superuser_only
def allProductesAdmin(request):

    productes = Producte.objects.all()

    # L' String és el nom de la variable que haig d'usar a la template
    context = {
        'productes': productes
    }

    return render(request, "llistat_productes_admin.html", context)


@superuser_only
def addProducte(request):

    if request.method == 'POST':
        form = ProductForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()

            messages.success(request, "El producte s'ha afegit correctament")
            return redirect("/afegir_producte")

    context = {
        'form': ProductForm()
    }

    return render(request, "afegir_producte.html", context)


@superuser_only
def editProducte(request, id):

    producte = Producte.objects.get(id_producte=id)

    # L' String és el nom de la variable que haig d'usar a la template
    context = {
        'form': ProductForm(instance=producte)
    }

    if request.method == 'POST':
        form = ProductForm(data=request.POST, instance=producte)

        if form.is_valid():
            form.save()
            context['form'] = form
            messages.success(request, "La pel·lícula s'ha modificat correctament")

    return render(request, "editar_producte.html", context)


@superuser_only
def deleteProducte(request, id):

    producte = Producte.objects.get(id_producte=id)
    producte.delete()

    return redirect(to="llistat_productes")
