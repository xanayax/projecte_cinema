from django.db import models

"""
Models del projecte:

si l' atribut blank està en false vol dir que no admetrà que estigui buit
"""

class Producte(models.Model):

    id_producte = models.AutoField(primary_key=True)
    nom = models.CharField(max_length=50, null=False)
    preu = models.FloatField(null=False)


class Client(models.Model):

    id_client = models.AutoField(primary_key=True)
    nom = models.CharField(max_length=30, null=False)
    cognom = models.CharField(max_length=50)
    email = models.CharField(max_length=40, null=False)
    telefon = models.CharField(max_length=15, null=False)
    username = models.CharField(max_length=40, null=False)
    password = models.CharField(max_length=100, null=False)
    id_producte = models.ForeignKey(Producte, null=False, blank=False, on_delete=models.CASCADE)


class Pelicula (models.Model):

    id_pelicula = models.AutoField(primary_key=True)
    titol = models.CharField(max_length=30, null=False)
    sinopsis = models.TextField(null=False)
    generes = models.CharField(max_length=30, null=False)
    duracio = models.CharField(max_length=5, null=False)
    director = models.CharField(max_length=30, null=False)
    actors = models.CharField(max_length=100, null=False)
    puntuacio = models.FloatField(null=False)
    qualificacio = models.CharField(max_length=5, null=False)
    imatge = models.CharField(max_length=50, null=False)


class Sala(models.Model):

    id_sala = models.AutoField(primary_key=True)
    num_sala = models.IntegerField(null=False)
    detalls = models.CharField(max_length=40)


class Sessio(models.Model):

    id_sessio = models.AutoField(primary_key=True)
    data = models.DateField(null=False)
    hora = models.TimeField(null=False)
    id_pelicula = models.ForeignKey(Pelicula, null=False, blank=False, on_delete=models.CASCADE)
    id_sala = models.ForeignKey(Sala, null=False, blank=False, on_delete=models.CASCADE)


class Reserva(models.Model):

    id_reserva = models.AutoField(primary_key=True)
    data = models.DateField(null=False)
    id_client = models.ForeignKey(Client, null=False, blank=False, on_delete=models.CASCADE)
    id_sessio = models.ForeignKey(Sessio, null=False, blank=False, on_delete=models.CASCADE)


class Fila(models.Model):

    id_fila = models.AutoField(primary_key=True)
    num_fila = models.IntegerField(null=False)
    id_sala = models.ForeignKey(Sala, null=False, blank=False, on_delete=models.CASCADE)


class Butaca(models.Model):

    id_butaca = models.AutoField(primary_key=True)
    num_butaca = models.IntegerField(null=False)
    id_sala = models.ForeignKey(Fila, null=False, blank=False, on_delete=models.CASCADE)