# Generated by Django 3.2.2 on 2021-05-18 08:32

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('gestio_cine', '0038_remove_butaca_sessio'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='butaca',
            name='ocupat',
        ),
        migrations.CreateModel(
            name='Butaca_Sessio',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ocupat', models.BooleanField(null=True)),
                ('id_butaca', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='gestio_cine.butaca')),
                ('id_sessio', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='gestio_cine.sessio')),
            ],
        ),
        migrations.AddField(
            model_name='butaca',
            name='sessio',
            field=models.ManyToManyField(through='gestio_cine.Butaca_Sessio', to='gestio_cine.Sessio'),
        ),
    ]
