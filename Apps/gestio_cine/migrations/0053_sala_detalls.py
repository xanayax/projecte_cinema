# Generated by Django 3.2.2 on 2021-05-18 18:00

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('gestio_cine', '0052_remove_sala_detalls'),
    ]

    operations = [
        migrations.AddField(
            model_name='sala',
            name='detalls',
            field=models.CharField(max_length=40, null=True),
        ),
    ]
