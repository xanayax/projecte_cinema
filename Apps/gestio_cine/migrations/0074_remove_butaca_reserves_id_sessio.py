# Generated by Django 3.2.2 on 2021-07-09 15:48

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gestio_cine', '0073_alter_butaca_reserves_id_sessio'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='butaca_reserves',
            name='id_sessio',
        ),
    ]
