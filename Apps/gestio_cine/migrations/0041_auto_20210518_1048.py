# Generated by Django 3.2.2 on 2021-05-18 08:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('gestio_cine', '0040_auto_20210518_1047'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='butaca_sessio',
            name='id_butaca_sessio',
        ),
        migrations.AddField(
            model_name='butaca_sessio',
            name='id',
            field=models.AutoField(auto_created=True, default=1, primary_key=True, serialize=False, verbose_name='ID'),
            preserve_default=False,
        ),
    ]
