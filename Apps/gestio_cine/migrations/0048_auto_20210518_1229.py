# Generated by Django 3.2.2 on 2021-05-18 10:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('gestio_cine', '0047_auto_20210518_1212'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='butaca',
            name='sessio',
        ),
        migrations.AlterField(
            model_name='butaca_sessio',
            name='id',
            field=models.AutoField(primary_key=True, serialize=False),
        ),
    ]