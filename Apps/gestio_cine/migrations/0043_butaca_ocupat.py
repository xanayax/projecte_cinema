# Generated by Django 3.2.2 on 2021-05-18 09:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('gestio_cine', '0042_auto_20210518_1048'),
    ]

    operations = [
        migrations.AddField(
            model_name='butaca',
            name='ocupat',
            field=models.BooleanField(null=True),
        ),
    ]
