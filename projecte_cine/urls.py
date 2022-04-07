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
from django.conf.urls import url
from django.contrib import admin
from django.contrib.auth.views import PasswordResetView, PasswordResetDoneView, PasswordResetConfirmView, \
    PasswordResetCompleteView
from django.urls import path
from django.conf import settings
from django.views.static import serve
from django.conf.urls.static import static
from Apps.gestio_cine.views import *

# urls de tota la web
urlpatterns = [
    path('admin/', admin.site.urls),
    path('registrar/', register_view, name='registrar'),
    path('login/', login_view, name='login'),
    path('logout/', logOut_view, name='logout'),
    path('', all_movies, name='cartellera'),
    path('llistat_pelicules/', all_movies_admin, name='llistat_pelicules'),
    path('afegir_pelicula/', add_movie, name='afegir_pelicula'),
    path('editar_pelicula/<id>', edit_movie, name='editar_pelicula'),
    path('eliminar_pelicula/<id>/', delete_movie, name='eliminar_pelicula'),
    path('info_pelicula/<id>/', movie_details, name='info_pelicula'),
    path('productes/', all_productes, name='productes'),
    path('llistat_productes/', all_productes_admin, name='llistat_productes'),
    path('afegir_producte/', add_producte, name='afegir_producte'),
    path('editar_producte/<id>/', edit_producte, name='editar_producte'),
    path('eliminar_producte/<id>/', delete_producte, name='eliminar_producte'),
    path('llistat_sessions/', all_sessions_admin, name='llistat_sessions'),
    path('afegir_sessio/', add_sessio, name='afegir_sessio'),
    path('editar_sessio/<id>/', edit_sessio, name='editar_sessio'),
    path('eliminar_sessio/<id>/', delete_sessio, name='eliminar_sessio'),
    path('seleccio_butaques/<id>/', seleccio_butaca, name='seleccio_butaques'),
    path('reservar_butaca/<id>/', reservar_butaca, name='reservar_butaca'),
    path('publicar_comentari/<id>/', public_comment, name='publicar_comentari'),
    path('llistat_comentaris/', all_comments_admin, name='llistat_comentaris'),
    path('eliminar_comentari/<id>/', delete_comment, name='eliminar_comentari'),
    path('formulari_pagament', formulari_pagament, name='formulari_pagament'),
    path('update_item/', updateItem, name='update_item'),
    path('activar_compte/<uidb64>/<token>', activate_user, name='activar_compte'),
    path('password_reset/', PasswordResetView.as_view(template_name='password_reset.html'), name='password_reset'),
    path('password_reset/done', PasswordResetDoneView.as_view(template_name='password_reset_done.html'), name='password_reset_done'),
    path('password_reset_confirm/<uidb64>/<token>/', PasswordResetConfirmView.as_view(template_name='password_reset_confirm.html'), name='password_reset_confirm'),
    path('password_reset_complete/', PasswordResetCompleteView.as_view(template_name='password_reset_complete.html'), name='password_reset_complete'),
]

urlpatterns += static(settings.MEDIA_URL, document_root = settings.MEDIA_ROOT)
url(r'^media/(?P<path>.*)$', serve,{'document_root': settings.MEDIA_ROOT}),
url(r'^static/(?P<path>.*)$', serve,{'document_root': settings.STATIC_ROOT})
