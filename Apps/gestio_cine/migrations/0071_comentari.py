# Generated by Django 3.2.2 on 2021-06-06 10:56

import datetime
from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('gestio_cine', '0070_delete_comentari'),
    ]

    operations = [
        migrations.CreateModel(
            name='Comentari',
            fields=[
                ('id_comentari', models.AutoField(primary_key=True, serialize=False)),
                ('comentari', models.TextField()),
                ('data', models.DateField(default=datetime.date.today)),
                ('id_pelicula', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='gestio_cine.pelicula')),
                ('id_usuari', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
