# Generated by Django 3.2.2 on 2021-06-05 05:47

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('gestio_cine', '0063_auto_20210604_2005'),
    ]

    operations = [
        migrations.CreateModel(
            name='Usuari',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('email', models.EmailField(max_length=60, unique=True, verbose_name='email')),
                ('username', models.CharField(max_length=30, unique=True)),
                ('first_name', models.CharField(max_length=50)),
                ('last_name', models.CharField(max_length=50)),
                ('date_joined', models.DateTimeField(auto_now_add=True, verbose_name='date joined')),
                ('last_login', models.DateTimeField(auto_now=True, verbose_name='last login')),
                ('is_admin', models.BooleanField(default=False)),
                ('is_active', models.BooleanField(default=True)),
                ('is_staff', models.BooleanField(default=False)),
                ('is_superuser', models.BooleanField(default=False)),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.AlterField(
            model_name='pelicula',
            name='duracio',
            field=models.IntegerField(),
        ),
        migrations.AlterField(
            model_name='pelicula',
            name='qualificacio',
            field=models.IntegerField(),
        ),
    ]
