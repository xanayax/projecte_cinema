# Generated by Django 3.2.2 on 2021-06-06 10:50

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gestio_cine', '0067_auto_20210606_1247'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='comentari',
            name='comentari',
        ),
    ]
