from django.contrib import admin
from django.urls import path, include
from jobs.views import signup, login_view

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('jobs.urls')),
    path('api/login/', login_view, name='login'),
    path('api/signup/', signup, name='signup'),
]
