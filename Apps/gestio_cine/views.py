from django.shortcuts import render
from .models import Pelicula

# Create your views here.
def homeView(request):
    return render(request, "index.html")

def registerView(request):
    return render(request, "registrar.html")

def loginView(request):
    return render(request, "login.html")

def moviesShowView(request):
    obj = Pelicula.objects.get(id_pelicula=2)
    context = {
        'object': obj
    }
    return render(request, "cartellera.html", context)

def allMovies(request):
    return render(request, "cartellera.html")
