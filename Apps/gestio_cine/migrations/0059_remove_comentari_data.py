# Generated by Django 3.2.2 on 2021-05-21 08:21

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gestio_cine', '0058_comentari_id_pelicula'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='comentari',
            name='data',
        ),
    ]