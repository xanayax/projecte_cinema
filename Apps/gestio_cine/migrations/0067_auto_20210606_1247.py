# Generated by Django 3.2.2 on 2021-06-06 10:47

import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('gestio_cine', '0066_auto_20210606_1246'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='comentari',
            name='id',
        ),
        migrations.AddField(
            model_name='comentari',
            name='comentari',
            field=models.TextField(default=1),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='comentari',
            name='data',
            field=models.DateField(default=datetime.date.today),
        ),
        migrations.AddField(
            model_name='comentari',
            name='id_comentari',
            field=models.AutoField(default=1, primary_key=True, serialize=False),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='comentari',
            name='id_pelicula',
            field=models.ForeignKey(default=3, on_delete=django.db.models.deletion.CASCADE, to='gestio_cine.pelicula'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='comentari',
            name='id_usuari',
            field=models.ForeignKey(default=3, on_delete=django.db.models.deletion.CASCADE, to='gestio_cine.usuari'),
            preserve_default=False,
        ),
    ]