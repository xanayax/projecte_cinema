# Generated by Django 3.1.5 on 2021-04-25 19:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('gestio_cine', '0009_auto_20210422_1137'),
    ]

    operations = [
        migrations.AddField(
            model_name='producte',
            name='imatge',
            field=models.ImageField(null=True, upload_to=''),
        ),
    ]
