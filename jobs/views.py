import json
from django.contrib.auth import authenticate, login
from django.http import JsonResponse
from rest_framework.authtoken.models import Token
from django.views.decorators.csrf import csrf_exempt
from .models import CustomUser, MainProfile,MainJob
from rest_framework import generics
from .serializers import MainJobSerializer,MainProfileSerializer
from rest_framework .views import APIView
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework import status
from rest_framework.decorators import authentication_classes
from rest_framework.decorators import permission_classes
import logging

@csrf_exempt
def signup(request):
    if request.method == 'POST':
        try:
            # Check the request content type to determine if it's JSON or form data
            content_type = request.META.get('CONTENT_TYPE')
            if content_type == 'application/json':
                data = json.loads(request.body.decode('utf-8'))
                email = data.get('email')
                password = data.get('password')
                first_name = data.get('first_name')
                last_name = data.get('last_name')
            else:
                # Handle form data
                email = request.POST.get('email')
                password = request.POST.get('password')
                first_name = request.POST.get('first_name')
                last_name = request.POST.get('last_name')

            # Check if the user with this email already exists
            user, created = CustomUser.objects.get_or_create(email=email)

            if not created:
                return JsonResponse({'error': 'User with this email already exists'}, status=400)

            # Set user's password
            user.set_password(password)

            # Save user data
            user.first_name = first_name
            user.last_name = last_name
            user.save()

            # Log the user in
            login(request, user)
            
            profile, _ = MainProfile.objects.get_or_create(user=user)
            profile.profession = data.get('profession', '')
            profile.name = f'{first_name} {last_name}'
            profile.email = email
            profile.phone = data.get('phone', '')
            profile.address = data.get('address', '')
            profile.save()  
            # Generate and return a token
            token, _ = Token.objects.get_or_create(user=user)

            return JsonResponse({'token': token.key})

        except KeyError:
            return JsonResponse({'error': 'Invalid form data in the request'}, status=400)
        except json.JSONDecodeError:
            return JsonResponse({'error': 'Invalid JSON data in the request'}, status=400)

    return JsonResponse({'error': 'Invalid request method'}, status=400)
@csrf_exempt
def login_view(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            email = data.get('email')
            password = data.get('password')

            # Authenticate user
            user = authenticate(request, username=email, password=password)

            if user:
                # Log the user in
                login(request, user)

                # Generate and return a token
                token, _ = Token.objects.get_or_create(user=user)

                return JsonResponse({'token': token.key})
        except json.JSONDecodeError:
            return JsonResponse({'error': 'Invalid JSON data in the request'}, status=400)

    return JsonResponse({'error': 'Invalid request method'}, status=400)


logger = logging.getLogger(__name__)

@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
class ProfileView(APIView):
    def get(self, request):
        try:
            logger.debug("Entering ProfileView")
            # Retrieve the user's profile data
            profile = MainProfile.objects.get(user=request.user)

            # Debug logging

            # Serialize the profile data
            serializer = MainProfileSerializer(profile)
            
            return Response(serializer.data)
        except MainProfile.DoesNotExist:
            logger.error("Profile not found")
            return Response({'error': 'Profile not found'}, status=status.HTTP_NOT_FOUND)
        
class MainJobList(generics.ListAPIView):
    queryset = MainJob.objects.all()
    serializer_class = MainJobSerializer
