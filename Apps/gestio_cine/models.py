from datetime import date

from django.db import models
from django.contrib.auth.models import User, AbstractBaseUser, BaseUserManager

"""
Models del projecte. Els mateixos models són la base de dades

si l' atribut blank està en false vol dir que no admetrà que estigui buit
"""

class UserManager(BaseUserManager):

    def create_user(self, email, username, first_name, last_name, password=None):

        if not email:
            raise ValueError("Introdueix un correu electrònic")

        if not username:
            raise ValueError("Introdueix nom d'usuari")

        if not first_name:
            raise ValueError("Introdueix nom")

        if not last_name:
            raise ValueError("Introdueix cognom")

        user = self.model(
            email = self.normalize_email(email),
            username = username,
            first_name = first_name,
            last_name = last_name
        )
        user.set_password(password)
        user.save(using=self._db)
        return user



    def create_superuser(self, email, username, first_name, last_name, password):

        user = self.create_user(
            email=self.normalize_email(email),
            username=username,
            first_name=first_name,
            last_name=last_name,
            password=password
        )

        user.is_admin = True
        user.is_staff = True
        user.is_superuser = True
        user.save(using=self._db)
        return user



# fem una classe per extendre del user base
class Usuari(AbstractBaseUser):

    email = models.EmailField(verbose_name="email", max_length=60, unique=True, null=False)
    username = models.CharField(max_length=30, unique=True, null=False)
    first_name = models.CharField(max_length=50, null=False)
    last_name = models.CharField(max_length=50, null=False)
    profile_pic = models.ImageField(null=True)
    date_joined = models.DateTimeField(verbose_name='date joined', auto_now_add=True)
    last_login = models.DateTimeField(verbose_name='last login', auto_now=True)
    is_admin = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)
    is_email_verified = models.BooleanField(default=False)

    # camp que s'utilitzarà per logar
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username', 'first_name', 'last_name']

    objects = UserManager()

    def __str__(self):
        return self.email

    def has_perm(self, perm, obj=None):
        return self.is_admin

    def has_module_perms(self, app_label):
        return True




class Producte(models.Model):

    id_producte = models.AutoField(primary_key=True)
    nom = models.CharField(max_length=50, null=False)
    preu = models.FloatField(null=False)
    imatge = models.ImageField(null=True)

    def __str__(self):
        return self.nom




class Generes(models.Model):

    id_genere = models.AutoField(primary_key=True)
    nom = models.CharField(max_length=50, null=False)

    def __str__(self):
        return self.nom




class Pelicula(models.Model):

    id_pelicula = models.AutoField(primary_key=True)
    titol = models.CharField(max_length=80, null=False)
    sinopsis = models.TextField(null=False)
    duracio = models.IntegerField(null=False)
    director = models.CharField(max_length=30, null=False)
    actors = models.CharField(max_length=100, null=False)
    puntuacio = models.FloatField(null=False)
    qualificacio = models.IntegerField(null=False)
    imatge = models.ImageField(null=True)
    preu = models.FloatField(null=False)
    id_genere = models.ForeignKey(Generes, null=False, blank=False, on_delete=models.CASCADE)

    def __str__(self):
        return self.titol




class Comentari(models.Model):

    id_comentari = models.AutoField(primary_key=True)
    comentari = models.TextField(null=False)
    data = models.DateField(default=date.today)
    id_usuari = models.ForeignKey(Usuari, null=False, blank=False, on_delete=models.CASCADE)
    id_pelicula = models.ForeignKey(Pelicula, null=False, blank=False, on_delete=models.CASCADE)

    def __str__(self):
        return self.comentari




class Sala(models.Model):

    id_sala = models.AutoField(primary_key=True)
    num_sala = models.IntegerField(null=False)
    detalls = models.CharField(max_length=40, null=True)
    id_pelicula = models.ForeignKey(Pelicula, null=False, blank=False, on_delete=models.CASCADE)

    def __str__(self):
        return str(self.num_sala)




class Sessio(models.Model):

    id_sessio = models.AutoField(primary_key=True)
    data = models.DateField(null=False)
    hora = models.TimeField(null=False)
    id_pelicula = models.ForeignKey(Pelicula, null=False, blank=False, on_delete=models.CASCADE)
    id_sala = models.ForeignKey(Sala, null=False, blank=False, on_delete=models.CASCADE)

    def __str__(self):
        return str(self.id_sessio)




class Reserva(models.Model):

    id_reserva = models.AutoField(primary_key=True)
    id_sessio = models.ForeignKey(Sessio, null=False, blank=False, on_delete=models.CASCADE)

    def __str__(self):
        return str(self.id_reserva)


class Fila(models.Model):

    id_fila = models.AutoField(primary_key=True)
    num_fila = models.IntegerField(null=False)
    id_sala = models.ForeignKey(Sala, null=False, blank=False, on_delete=models.CASCADE)

    def __str__(self):
        return str(self.num_fila)



class Butaca(models.Model):

    id_butaca = models.AutoField(primary_key=True)
    num_butaca = models.IntegerField(null=False)
    id_fila = models.ForeignKey(Fila, null=False, blank=False, on_delete=models.CASCADE)
    reserva = models.ManyToManyField(Reserva, through='Butaca_Reserves')

    def __str__(self):
        return str(self.num_butaca)




class Butaca_Reserves(models.Model):

    id_butaca_reserves = models.AutoField(primary_key=True)
    id_butaca = models.ForeignKey(Butaca, null=False, blank=False, on_delete=models.CASCADE)
    id_reserva = models.ForeignKey(Reserva, null=False, blank=False, on_delete=models.CASCADE)
    id_sessio = models.ForeignKey(Sessio, null=True, blank=False, on_delete=models.CASCADE)

    def __str__(self):
        return str(self.id_butaca_reserves)