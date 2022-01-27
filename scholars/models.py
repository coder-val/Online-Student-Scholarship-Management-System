from tkinter import CASCADE
from django.db import models
from django.contrib.auth.models import User
from django.urls import reverse

# Create your models here.
class Scholar(models.Model):

    college_choice = [
    ('CA', 'CA'),
    ('CBEA', 'CBEA'),
    ('CCJE', 'CCJE'),
    ('CHM', 'CHM'),
    ('CICS', 'CICS'),
    ('CTE', 'CTE')
    ]

    college_year_choice = [
        ('1', '1'),
        ('2', '2'),
        ('3', '3'),
        ('4', '4')
    ]

    program_choice = [
        # ('Tulong Dunong Program', 'Tulong Dunong Program'),
        # ('Tertiary Education Subsidy', 'Tertiary Education Subsidy'),
        ('CHED-TDP', 'CHED-TDP'),
        ('CHED-TES', 'CHED-TES'),
    ]

    remarks_choice = [
        ('NEW', 'NEW'),
        ('PENDING', 'PENDING'),
        ('OK', 'OK'),
    ]
    
    student_ID = models.OneToOneField(User, null=True, on_delete=models.CASCADE)
    # student_ID = models.CharField(max_length=10, unique=True)
    last_name = models.CharField(max_length=40)
    first_name = models.CharField(max_length=40)
    middle_name = models.CharField(max_length=40)
    contact_number = models.CharField(max_length=30)
    college = models.CharField(max_length=10, choices=college_choice)
    college_year = models.CharField(max_length=1, choices=college_year_choice)
    scholarship_program = models.CharField(max_length=40, choices=program_choice)
    zip_file = models.FileField(upload_to='', blank=True, null=True)
    remarks = models.CharField(max_length=10, choices=remarks_choice, default='NEW', blank=True)

    class Meta:
        db_table = 'scholars'

    def __str__(self):
        return self.first_name

    def delete(self, *args, **kwargs):
        self.zip_file.delete()
        super().delete(*args, **kwargs)

    def get_absolute_url(self):
        return reverse('scholar_list')