from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django import forms
from .models import Client, Pelicula, Producte

# creem la classe que tindrà els camps del formulari
class SignUpForm(forms.ModelForm):
    class Meta:
        model = Client
        fields = '__all__'

# class SignUpForm(UserCreationForm):
#
#     phone = forms.CharField(required=True, max_length=15)
#
#     class Meta:
#         model = User
#         fields = ['first_name', 'last_name', 'email', 'phone', 'username', 'password1', 'password2']


# phone = forms.CharField(required=True, max_length=15)
    #
    # first_name = forms.TextInput(attrs={'class': 'form-control form-control-sm'})
    # last_name = forms.TextInput(attrs={'class': 'form-control form-control-sm'})
    # email = forms.TextInput(attrs={'class': 'form-control form-control-sm'})
    # phone_ix = forms.TextInput(attrs={'class': 'form-control form-control-sm'})
    # username = forms.TextInput(attrs={'class': 'form-control form-control-sm'})
    # password1 = forms.PasswordInput(attrs={'class': 'form-control form-control-sm'})
    # password2 = forms.TextInput(attrs={'class': 'form-control form-control-sm'})
    #
    # class Meta:
    #     model = User
    #     fields = ['first_name', 'last_name', 'email', 'phone', 'username', 'password1', 'password2']


class MovieForm(forms.ModelForm):
    class Meta:
        model = Pelicula
        fields = '__all__'


class ProductForm(forms.ModelForm):
    class Meta:
        model = Producte
        fields = '__all__'