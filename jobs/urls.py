# Example urls.py in your app
from django.urls import path
from . import views
from .views import MainJobList

urlpatterns = [
    path('api/profile/', views.ProfileView.as_view(), name='profile'),
    path('api/mainjobs/', MainJobList.as_view(), name='mainjobs-list'),
    path('api/signup/', views.signup, name='signup'),
    path('api/login/', views.login_view, name='login'),
]
