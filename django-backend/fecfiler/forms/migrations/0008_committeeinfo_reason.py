# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2018-09-24 17:06
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('forms', '0007_committee'),
    ]

    operations = [
        migrations.AddField(
            model_name='committeeinfo',
            name='reason',
            field=models.TextField(default='-', max_length=3),
        ),
    ]
