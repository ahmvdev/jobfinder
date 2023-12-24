from django.contrib.auth.models import AbstractUser
from django.db import models
from django.conf import settings


class CustomUser(AbstractUser):
    email = models.EmailField(unique=True)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    username = models.CharField(max_length=30, unique=False, default='')
    USERNAME_FIELD = 'email'  
    REQUIRED_FIELDS = ['username']
    def __str__(self):
        return self.email

    def save(self, *args, **kwargs):
        created = not self.pk
        super().save(*args, **kwargs)

        if created and not hasattr(self, 'mainprofile'):
            MainProfile.objects.create(user=self)

class MainJob(models.Model):
    job_id = models.AutoField(primary_key=True)
    job_title = models.CharField(max_length=255)
    job_description = models.TextField()
    company = models.CharField(max_length=255)
    salary = models.DecimalField(max_digits=10, decimal_places=2)
    publish_date = models.CharField(max_length=100)
    location = models.CharField(max_length=255)
    url = models.URLField(max_length=255)
    category = models.CharField(max_length=255)
    

    class Meta:
        db_table = 'main_jobs'  

    def __str__(self):
        return self.job_title

class MainProfile(models.Model):
    user = models.OneToOneField(CustomUser, on_delete=models.CASCADE, related_name='profile')
    profession = models.CharField(max_length=100)
    name = models.CharField(max_length=255)
    email = models.EmailField(max_length=255)
    phone = models.CharField(max_length=20)
    address = models.TextField()
    profileImage = models.ImageField(upload_to='profile_images/',default='../assets/profile.jpg')

    def __str__(self):
        return self.name


