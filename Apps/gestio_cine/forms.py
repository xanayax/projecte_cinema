from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django import forms
from .models import Pelicula, Producte, Sessio

class SignUpForm(UserCreationForm):

    class Meta:
        model = User
        fields = ['first_name', 'last_name', 'email', 'username', 'password1', 'password2']


class MovieForm(forms.ModelForm):
    class Meta:
        model = Pelicula
        fields = '__all__'

        widgets = {
            'titol': forms.TextInput(attrs={'class': 'form-control form-control-sm'}),
            'sinopsis': forms.Textarea(attrs={'class': 'form-control form-control-sm'}),
            'generes': forms.Select(attrs={'class': 'form-control form-control-sm'}),
            'director': forms.TextInput(attrs={'class': 'form-control form-control-sm'}),
            'actors': forms.TextInput(attrs={'class': 'form-control form-control-sm'}),
            'duracio': forms.TextInput(attrs={'class': 'form-control form-control-sm'}),
            'puntuacio': forms.TextInput(attrs={'class': 'form-control form-control-sm'}),
            'qualificacio': forms.TextInput(attrs={'class': 'form-control form-control-sm'}),
        }


class ProductForm(forms.ModelForm):
    class Meta:
        model = Producte
        fields = '__all__'

        widgets = {
            'nom': forms.TextInput(attrs={'class': 'form-control form-control-sm'}),
            'preu': forms.TextInput(attrs={'class': 'form-control form-control-sm'}),
        }


class SessionForm(forms.ModelForm):
    class Meta:
        model = Sessio
        fields = '__all__'


    widgets = {
        'id_pelicula': forms.TextInput(attrs={'class': 'form-control form-control-sm'}),
        'id_sala': forms.TextInput(attrs={'class': 'form-control form-control-sm'}),
    }

