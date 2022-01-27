# Generated by Django 4.0.1 on 2022-01-19 00:55

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('scholars', '0006_remove_scholar_student_id'),
    ]

    operations = [
        migrations.AddField(
            model_name='scholar',
            name='student_ID',
            field=models.OneToOneField(null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
    ]
