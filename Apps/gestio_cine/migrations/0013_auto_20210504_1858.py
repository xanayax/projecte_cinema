# Generated by Django 3.1.5 on 2021-05-04 16:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('gestio_cine', '0012_auto_20210504_1630'),
    ]

    operations = [
        migrations.AlterField(
            model_name='pelicula',
            name='imatge',
            field=models.ImageField(upload_to=''),
        ),
    ]
