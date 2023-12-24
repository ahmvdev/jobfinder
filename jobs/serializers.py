from rest_framework import serializers
from .models import CustomUser,MainJob,MainProfile

class CustomUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = ('id', 'email', 'first_name', 'last_name')

class LoginSerializer(serializers.Serializer):
    email = serializers.EmailField()
    password = serializers.CharField()

class MainJobSerializer(serializers.ModelSerializer):
    class Meta:
        model = MainJob
        fields = '__all__'
class MainProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = MainProfile
        fields = '__all__'       