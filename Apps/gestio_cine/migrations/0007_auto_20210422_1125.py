# Generated by Django 3.1.5 on 2021-04-22 09:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('gestio_cine', '0006_client_user'),
    ]

    operations = [
        migrations.AlterField(
            model_name='pelicula',
            name='imatge',
            field=models.ImageField(null=True, upload_to=''),
        ),
    ]
