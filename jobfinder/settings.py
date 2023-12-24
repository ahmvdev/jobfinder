

from pathlib import Path


BASE_DIR = Path(__file__).resolve().parent.parent




# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'django-insecure-4=&4zxr2p%z!)%0g_*yisw9+bh(^f=at^#p_*!gn-9^w4v7r+e'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = []



# Application definition

INSTALLED_APPS = [
    'corsheaders',
    'jobfinder',
    'jobs',
    'rest_framework.authtoken',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
]
REST_FRAMEWORK = {
    'DEFAULT_AUTHENTICATION_CLASSES': (
        'rest_framework.authentication.TokenAuthentication',
    ),
    
}
AUTHENTICATION_CLASSES = [
    'rest_framework.authentication.TokenAuthentication',
    'django.contrib.auth.backends.ModelBackend',
]

MIDDLEWARE = [
    'corsheaders.middleware.CorsMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True


ROOT_URLCONF = 'jobfinder.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'jobfinder.wsgi.application'


# Database


DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'jobfinder',
        'USER': 'root',
        'PASSWORD': '',
        'HOST': 'localhost',  # Or the hostname of your database server
        'PORT': '3306',  # Or the port of your database server
    }
}

AUTH_USER_MODEL = 'jobs.CustomUser'



# Password validation


AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

# settings.py
import os

LOGGING_DIR = os.path.join(BASE_DIR, 'logs')
if not os.path.exists(LOGGING_DIR):
    os.makedirs(LOGGING_DIR)

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'file': {
            'level': 'DEBUG',  # Change this level as needed
            'class': 'logging.FileHandler',
            'filename': os.path.join(LOGGING_DIR, 'django.log'),
        },
    },
    'root': {
        'handlers': ['file'],
        'level': 'DEBUG',
    },
}


# Internationalization

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)


STATIC_URL = '/static/'

# Default primary key field type


DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'
