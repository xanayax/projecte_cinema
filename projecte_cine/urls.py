"""projecte_cine URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from Apps.gestio_cine.views import *

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', homeView),
    path('registrar/', registerView, name='registrar'),
    path('login/', loginView, name='login'),
    path('logout/', logOutView, name='logout'),
    path('cartellera/', allMovies, name='cartellera'),
    path('llistat_pelicules/', allMoviesAdmin, name='llistat_pelicules'),
    path('afegir_pelicula/', addMovie, name='afegir_pelicula'),
    path('editar_pelicula/<id>', editMovie, name='editar_pelicula'),
    path('eliminar_pelicula/<id>/', deleteMovie, name='eliminar_pelicula'),
    path('info_pelicula/<id>/', movieDetails, name='info_pelicula'),
    path('productes/', allProductes, name='productes'),
    path('llistat_productes/', allProductesAdmin, name='llistat_productes'),
    path('afegir_producte/', addProducte, name='afegir_producte'),
    path('editar_producte/<id>/', editProducte, name='editar_producte'),
    path('eliminar_producte/<id>/', deleteProducte, name='eliminar_producte'),
    path('llistat_sessions/', allSessionsAdmin, name='llistat_sessions'),
    path('afegir_sessio/', addSessio, name='afegir_sessio'),
    path('editar_sessio/<id>/', editSessio, name='editar_sessio'),
    path('eliminar_sessio/<id>/', deleteSessio, name='eliminar_sessio'),
    path('seleccio_butaques/<id>/', seleccioButaca, name='seleccio_butaques'),
    path('reservar_butaca/<id>/', reservarButaca, name='reservar_butaca'),
    path('publicar_comentari/<id>/', publicarComentari, name='publicar_comentari'),
]

urlpatterns += static(settings.MEDIA_URL, document_root = settings.MEDIA_ROOT)
