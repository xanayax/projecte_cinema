from django.contrib.auth import get_user_model
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django import forms
from django.contrib.auth.forms import ReadOnlyPasswordHashField
from .models import Pelicula, Producte, Sessio, Comentari

User = get_user_model()

class RegisterForm(forms.ModelForm):
    """
    The default

    """

    password = forms.CharField(widget=forms.PasswordInput)
    password_2 = forms.CharField(label='Confirm Password', widget=forms.PasswordInput)

    class Meta:
        model = User
        fields = ['email', 'first_name', 'last_name', 'username']

    def clean_email(self):
        '''
        Verify email is available.
        '''
        email = self.cleaned_data.get('email')
        qs = User.objects.filter(email=email)
        if qs.exists():
            raise forms.ValidationError("email is taken")
        return email

    def clean(self):
        '''
        Verify both passwords match.
        '''
        cleaned_data = super().clean()
        password1 = cleaned_data.get("password1")
        password2 = cleaned_data.get("password2")
        if password1 is not None and password1 != password2:
            self.add_error("password_2", "Your passwords must match")
        return cleaned_data




# class LoginForm(forms.Form):
#     email = forms.EmailField()
#     password = forms.CharField(widget=forms.PasswordInput)


class MovieForm(forms.ModelForm):
    class Meta:
        model = Pelicula
        fields = '__all__'

        widgets = {
            'titol':  forms.TextInput(attrs={'class': 'form-control form-control-sm'}),
            'sinopsis': forms.Textarea(attrs={'class': 'form-control form-control-sm'}),
            'generes': forms.Select(attrs={'class': 'form-control form-control-sm'}),
            'director': forms.TextInput(attrs={'class': 'form-control form-control-sm'}),
            'actors': forms.TextInput(attrs={'class': 'form-control form-control-sm'}),
            'duracio': forms.TextInput(attrs={'class': 'form-control form-control-sm'}),
            'puntuacio': forms.TextInput(attrs={'class': 'form-control form-control-sm'}),
            'qualificacio': forms.TextInput(attrs={'class': 'form-control form-control-sm'}),
            'preu': forms.TextInput(attrs={'class': 'form-control form-control-sm'}),
            'id_genere': forms.Select(attrs={'class': 'form-control form-control-sm'}),
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
            'id_pelicula': forms.Select(attrs={'class': 'form-control form-control-sm'}),
            'data': forms.TextInput(attrs={'class': 'form-control form-control-sm'}),
            'hora': forms.TextInput(attrs={'class': 'form-control form-control-sm'}),
            'id_sala': forms.Select(attrs={'class': 'form-control form-control-sm'}),
        }


class CommentForm(forms.ModelForm):
    class Meta:
        model = Comentari
        exclude = ('data', 'id_pelicula', 'id_usuari')

        widgets = {
            'id_comentari': forms.TextInput(attrs={'class': 'form-control form-control-sm'}),
            'comentari': forms.Textarea(attrs={'class': 'form-control form-control-sm'}),
        }