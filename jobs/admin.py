from django.contrib import admin
from .models import CustomUser,MainJob  # Make sure to import your CustomUser model

# Register your models here
admin.site.register(CustomUser)
admin.site.register(MainJob)