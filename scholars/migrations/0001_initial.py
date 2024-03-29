# Generated by Django 4.0.1 on 2022-01-16 22:17

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Scholar',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('student_ID', models.CharField(max_length=10, unique=True)),
                ('last_name', models.CharField(max_length=40)),
                ('first_name', models.CharField(max_length=40)),
                ('middle_name', models.CharField(max_length=40)),
                ('college', models.CharField(choices=[('CBEA', 'CBEA'), ('CA', 'CA'), ('CTE', 'CTE'), ('CHM', 'CHM'), ('CICS', 'CICS'), ('CCJE', 'CCJE')], max_length=10)),
                ('college_year', models.CharField(choices=[('3', '3'), ('4', '4'), ('1', '1'), ('2', '2')], max_length=1)),
                ('scholarship_program', models.CharField(choices=[('CHED-TES', 'CHED-TES'), ('CHED-TDP', 'CHED-TDP')], max_length=40)),
                ('zip_file', models.FileField(blank=True, null=True, upload_to='files')),
                ('remarks', models.CharField(blank=True, choices=[('OK', 'OK'), ('NEW', 'NEW'), ('INC', 'INC')], default='NEW', max_length=10)),
            ],
            options={
                'db_table': 'scholars',
            },
        ),
    ]
