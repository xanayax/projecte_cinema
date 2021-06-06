# Generated by Django 3.2.2 on 2021-06-06 10:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('gestio_cine', '0065_usuari_is_email_verified'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='comentari',
            name='comentari',
        ),
        migrations.RemoveField(
            model_name='comentari',
            name='data',
        ),
        migrations.RemoveField(
            model_name='comentari',
            name='id_comentari',
        ),
        migrations.RemoveField(
            model_name='comentari',
            name='id_pelicula',
        ),
        migrations.RemoveField(
            model_name='comentari',
            name='id_usuari',
        ),
        migrations.AddField(
            model_name='comentari',
            name='id',
            field=models.AutoField(auto_created=True, default=1, primary_key=True, serialize=False, verbose_name='ID'),
            preserve_default=False,
        ),
    ]
