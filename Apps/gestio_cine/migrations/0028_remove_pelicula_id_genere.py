# Generated by Django 3.2.2 on 2021-05-11 08:00

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gestio_cine', '0027_pelicula_id_genere'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='pelicula',
            name='id_genere',
        ),
    ]
