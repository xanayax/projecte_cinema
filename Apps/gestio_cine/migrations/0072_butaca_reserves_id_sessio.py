# Generated by Django 3.2.2 on 2021-07-09 15:42

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('gestio_cine', '0071_comentari'),
    ]

    operations = [
        migrations.AddField(
            model_name='butaca_reserves',
            name='id_sessio',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='gestio_cine.sessio'),
            preserve_default=False,
        ),
    ]
