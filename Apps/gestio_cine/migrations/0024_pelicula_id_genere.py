# Generated by Django 3.2.2 on 2021-05-11 07:21

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('gestio_cine', '0023_generes'),
    ]

    operations = [
        migrations.AddField(
            model_name='pelicula',
            name='id_genere',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='gestio_cine.generes'),
            preserve_default=False,
        ),
    ]
