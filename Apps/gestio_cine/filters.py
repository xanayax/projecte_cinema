import django_filters

from .models import *
from .forms import *

class PeliculesFilter(django_filters.FilterSet):
    class Meta:
        model = Pelicula
        fields = ['id_genere']

        widgets ={
            'id_genere': forms.Select(attrs={'class': 'form-control form-control-sm'})
        }