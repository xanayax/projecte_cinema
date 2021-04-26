from django.shortcuts import render, redirect
from .models import *
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.forms import UserCreationForm
from .forms import SignUpForm, MovieForm, ProductForm

# Create your views here.
def homeView(request):
    return render(request, "index.html")

# registrar-se a la pàgina
def registerView(request):

    form = SignUpForm()

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


    # if request.method == 'POST':
    #     if request.POST.get('nom') and request.POST.get('email') and request.POST.get('telefon') and request.POST.get('username') and request.POST.get('password'):
    #         save_record = Client()
    #         save_record.nom = request.POST.get('nom')
    #         save_record.cognom = request.POST.get('cognom')
    #         save_record.telefon = request.POST.get('telefon')
    #         save_record.username = request.POST.get('username')
    #         save_record.password = request.POST.get('password')
    #
    #         messages.success(request, "Usuari creat amb èxit")
    #         return redirect('/login')
    #
    #     else:
    #         messages.error(request, "Error")
    #
    # return render(request, "registrar.html")


# iniciar sessió a la pàgina
def loginView(request):

    if request.method == 'POST':
        email = request.POST.get('email')
        password = request.POST.get('password')

        user = authenticate(request, email=email, password=password)

        if user is not None:
            login(request, user)
            return redirect('')

        else:
            messages.error(request, 'Correu o contrasenya incorrecta')

    context = {}

    return render(request, "login.html", context)



def allMovies(request):

    pelicules = Pelicula.objects.all()

    # L' String és el nom de la variable que haig d'usar a la template
    context = {
        'pelicules': pelicules
    }

    return render(request, "cartellera.html", context)


def allMoviesAdmin(request):

    pelicules = Pelicula.objects.all()

    # L' String és el nom de la variable que haig d'usar a la template
    context = {
        'pelicules': pelicules
    }

    return render(request, "llistat_pelis_admin.html", context)



def addMovie(request):

    if request.method == 'POST':
        form = MovieForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()

            messages.success(request, "La pel·lícula s'ha afegit correctament")
            return redirect("/afegir_pelicula")

    context = {
        'form': MovieForm()
    }

    return render(request, "afegir_pelicula.html", context)



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



def allProductesAdmin(request):

    productes = Producte.objects.all()

    # L' String és el nom de la variable que haig d'usar a la template
    context = {
        'productes': productes
    }

    return render(request, "llistat_productes_admin.html", context)



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



def deleteProducte(request, id):

    producte = Producte.objects.get(id_pelicula=id)
    producte.delete()

    return redirect(to="llistat_productes")
