# Generated by Django 4.0.1 on 2022-01-17 11:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('scholars', '0002_scholar_contact_number_alter_scholar_college_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='scholar',
            name='contact_number',
            field=models.CharField(max_length=30),
        ),
    ]
