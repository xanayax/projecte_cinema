# Generated by Django 3.2.2 on 2021-05-20 07:48

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gestio_cine', '0053_sala_detalls'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='butaca',
            name='ocupat',
        ),
    ]