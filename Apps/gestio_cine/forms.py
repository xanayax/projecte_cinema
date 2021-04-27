from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django import forms
from .models import Client, Pelicula, Producte

# creem la classe que tindrà els camps del formulari
# class SignUpForm(forms.ModelForm):
#     class Meta:
#         model = Client
#         fields = '__all__'

class SignUpForm(UserCreationForm):

    class Meta:
        model = User
        fields = ['first_name', 'last_name', 'email', 'username', 'password1', 'password2']


class MovieForm(forms.ModelForm):
    class Meta:
        model = Pelicula
        fields = '__all__'


class ProductForm(forms.ModelForm):
    class Meta:
        model = Producte
        fields = '__all__'