# Generated by Django 3.2.2 on 2021-05-21 07:42

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('gestio_cine', '0057_auto_20210521_0846'),
    ]

    operations = [
        migrations.AddField(
            model_name='comentari',
            name='id_pelicula',
            field=models.ForeignKey(default=4, on_delete=django.db.models.deletion.CASCADE, to='gestio_cine.pelicula'),
            preserve_default=False,
        ),
    ]
