from django.shortcuts import render

# Create your views here.
def homeView (request):
    return render(request, "index.html")

def registerView (request):
    return render(request, "registrar.html")