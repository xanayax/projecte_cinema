# Generated by Django 3.2.2 on 2021-05-11 07:13

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gestio_cine', '0019_auto_20210511_0901'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='pelicula',
            name='id_genere',
        ),
    ]
