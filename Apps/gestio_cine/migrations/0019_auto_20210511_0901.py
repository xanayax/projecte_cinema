# Generated by Django 3.2.2 on 2021-05-11 07:01

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('gestio_cine', '0018_auto_20210511_0857'),
    ]

    operations = [
        migrations.CreateModel(
            name='Generes',
            fields=[
                ('id_genere', models.AutoField(primary_key=True, serialize=False)),
                ('nom', models.CharField(max_length=50)),
            ],
        ),
        migrations.RemoveField(
            model_name='pelicula',
            name='generes',
        ),
        migrations.AddField(
            model_name='pelicula',
            name='id_genere',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='gestio_cine.generes'),
            preserve_default=False,
        ),
    ]
