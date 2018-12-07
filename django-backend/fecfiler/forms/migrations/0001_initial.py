# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2018-12-07 17:17
from __future__ import unicode_literals

from django.db import migrations, models
import fecfiler.forms.validators


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Committee',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('committeeid', models.CharField(max_length=9)),
                ('committeename', models.CharField(max_length=200)),
                ('street1', models.CharField(max_length=34)),
                ('street2', models.CharField(max_length=34)),
                ('city', models.CharField(max_length=30)),
                ('state', models.CharField(max_length=2)),
                ('zipcode', models.IntegerField()),
                ('treasurerlastname', models.CharField(max_length=30)),
                ('treasurerfirstname', models.CharField(max_length=20)),
                ('treasurermiddlename', models.CharField(max_length=20)),
                ('treasurerprefix', models.CharField(max_length=10)),
                ('treasurersuffix', models.CharField(max_length=10)),
                ('email_on_file', models.TextField(default='-', max_length=100)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('deleted_at', models.DateTimeField(null=True)),
                ('isdeleted', models.BooleanField(default=False)),
            ],
            options={
                'verbose_name_plural': 'Committee',
                'verbose_name': 'Committee',
            },
        ),
        migrations.CreateModel(
            name='CommitteeInfo',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('committeeid', models.CharField(max_length=9)),
                ('committeename', models.CharField(max_length=200)),
                ('street1', models.CharField(max_length=34)),
                ('street2', models.CharField(max_length=34, null=True)),
                ('text', models.TextField(default='-', max_length=20000)),
                ('reason', models.CharField(default='-', max_length=3)),
                ('city', models.CharField(max_length=30)),
                ('state', models.CharField(max_length=2)),
                ('zipcode', models.TextField(max_length=5)),
                ('treasurerlastname', models.CharField(max_length=30)),
                ('treasurerfirstname', models.CharField(max_length=20)),
                ('treasurermiddlename', models.CharField(max_length=20, null=True)),
                ('treasurerprefix', models.CharField(max_length=10, null=True)),
                ('treasurersuffix', models.CharField(max_length=10, null=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('deleted_at', models.DateTimeField(null=True)),
                ('isdeleted', models.BooleanField(default=False)),
                ('is_submitted', models.BooleanField(default=False)),
                ('signee', models.CharField(default='-', max_length=30)),
                ('email_on_file', models.TextField(default='-', max_length=100)),
                ('additional_email_1', models.TextField(default='-', max_length=100, null=True)),
                ('additional_email_2', models.TextField(default='-', max_length=100, null=True)),
                ('file', models.FileField(blank=True, null=True, upload_to='forms.F99Attachment/bytes/filename/mimetype', validators=[fecfiler.forms.validators.validate_is_pdf])),
                ('form_type', models.CharField(default='F99', max_length=3)),
                ('coverage_start_date', models.DateField(null=True)),
                ('coverage_end_date', models.DateField(null=True)),
            ],
            options={
                'verbose_name_plural': 'CommitteeInfo',
                'verbose_name': 'CommitteeInfo',
            },
        ),
        migrations.CreateModel(
            name='F99Attachment',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('bytes', models.TextField()),
                ('filename', models.CharField(max_length=255)),
                ('mimetype', models.CharField(max_length=50)),
            ],
        ),
    ]
