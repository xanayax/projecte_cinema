from django.db import models
from django.contrib.auth.models import User

"""
Models del projecte:

si l' atribut blank està en false vol dir que no admetrà que estigui buit
"""

class Producte(models.Model):

    id_producte = models.AutoField(primary_key=True)
    nom = models.CharField(max_length=50, null=False)
    preu = models.FloatField(null=False)
    imatge = models.ImageField(null=True)

    def __str__(self):
        return self.nom


class Client(models.Model):

    user = models.OneToOneField(User, null=True, on_delete=models.CASCADE)
    id_client = models.AutoField(primary_key=True)
    nom = models.CharField(max_length=30, null=False)
    cognom = models.CharField(max_length=50)
    email = models.CharField(max_length=40, null=False)
    telefon = models.CharField(max_length=15, null=False)
    username = models.CharField(max_length=40, null=False)
    password = models.CharField(max_length=100, null=False)
    id_producte = models.ForeignKey(Producte, null=True, blank=True, on_delete=models.CASCADE)

    def __str__(self):
        return self.nom

    class Meta:
        db_table = "gestio_cine_client"


class Pelicula (models.Model):

    genere = (
        ('Acció', 'Acció'),
        ('Animació', 'Animació'),
        ('Terror', 'Terror'),
        ('Suspens', 'Suspens'),
        ('Aventura', 'Aventura'),
        ('Comèdia', 'Comèdia'),
        ('Romance', 'Romance'),
    )

    id_pelicula = models.AutoField(primary_key=True)
    titol = models.CharField(max_length=30, null=False)
    sinopsis = models.TextField(null=False)
    generes = models.CharField(max_length=30, null=False, choices=genere)
    duracio = models.CharField(max_length=5, null=False)
    director = models.CharField(max_length=30, null=False)
    actors = models.CharField(max_length=100, null=False)
    puntuacio = models.FloatField(null=False)
    qualificacio = models.CharField(max_length=5, null=False)
    imatge = models.ImageField(null=True)

    def __str__(self):
        return self.titol


class Sala(models.Model):

    id_sala = models.AutoField(primary_key=True)
    num_sala = models.IntegerField(null=False)
    detalls = models.CharField(max_length=40)

    def __str__(self):
        return self.num_sala


class Sessio(models.Model):

    id_sessio = models.AutoField(primary_key=True)
    data = models.DateField(null=False)
    hora = models.TimeField(null=False)
    id_pelicula = models.ForeignKey(Pelicula, null=False, blank=False, on_delete=models.CASCADE)
    id_sala = models.ForeignKey(Sala, null=False, blank=False, on_delete=models.CASCADE)

    def __str__(self):
        return self.id_sessio


class Reserva(models.Model):

    id_reserva = models.AutoField(primary_key=True)
    data = models.DateField(null=False)
    id_client = models.ForeignKey(Client, null=False, blank=False, on_delete=models.CASCADE)
    id_sessio = models.ForeignKey(Sessio, null=False, blank=False, on_delete=models.CASCADE)

    def __str__(self):
        return self.id_reserva


class Fila(models.Model):

    id_fila = models.AutoField(primary_key=True)
    num_fila = models.IntegerField(null=False)
    id_sala = models.ForeignKey(Sala, null=False, blank=False, on_delete=models.CASCADE)

    def __str__(self):
        return self.num_fila


class Butaca(models.Model):

    id_butaca = models.AutoField(primary_key=True)
    num_butaca = models.IntegerField(null=False)
    id_sala = models.ForeignKey(Fila, null=False, blank=False, on_delete=models.CASCADE)

    def __str__(self):
        return self.num_butaca