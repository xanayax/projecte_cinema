# Generated by Django 3.2.2 on 2021-05-11 08:01

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gestio_cine', '0028_remove_pelicula_id_genere'),
    ]

    operations = [
        migrations.DeleteModel(
            name='Generes',
        ),
    ]