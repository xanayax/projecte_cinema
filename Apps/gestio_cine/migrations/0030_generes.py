# Generated by Django 3.2.2 on 2021-05-11 08:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('gestio_cine', '0029_delete_generes'),
    ]

    operations = [
        migrations.CreateModel(
            name='Generes',
            fields=[
                ('id_genere', models.AutoField(primary_key=True, serialize=False)),
                ('nom', models.CharField(max_length=50)),
            ],
        ),
    ]
