"""
Django settings for FEC-EFiler project.

Django 1.11.

For more information on this file, see
https://docs.djangoproject.com/en/1.11/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.11/ref/settings/
"""

import os
import datetime
from corsheaders.defaults import default_headers
import logging

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.11/howto/deployment/checklist/

DEBUG = os.environ.get('DEBUG', False)

TEMPLATE_DEBUG = DEBUG
CSRF_TRUSTED_ORIGINS = ['localhost',os.environ.get('FRONTEND_URL', 'api')]
BASE_DIR = os.path.dirname(os.path.dirname(__file__))

DATA_RECEIVE_API_URL=os.environ.get('DATA_RECEIVER_URL', 'http://127.0.0.1:8002')
DATA_RECEIVE_API_VERSION = "/api/v1/"


# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '!0)(sp6(&$=_70&+_(zogh24=)@5&smwtuwq@t*v88tn-#m=)z'


ROOT_URLCONF = 'fecfiler.urls'
WSGI_APPLICATION = 'fecfiler.wsgi.application'
AUTH_USER_MODEL = 'authentication.Account'

ALLOWED_HOSTS = ['*']

# Application definition

INSTALLED_APPS = [
    'djangocms_admin_style',
    'admin_shortcuts',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'rest_framework',
    'rest_framework_swagger',
    'compressor',
    'corsheaders',
    'fecfiler.authentication',
    #'fecfiler.posts',
    'fecfiler.forms',
    'db_file_storage',
]


MIDDLEWARE = [
    'corsheaders.middleware.CorsMiddleware',
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]


TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': ['templates','static/templates'],
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

#if DEBUG == True:
CORS_ORIGIN_ALLOW_ALL = True
#else:
#    CORS_ORIGIN_WHITELIST = ['localhost',os.environ.get('FRONTEND_URL', 'api')]

CORS_ALLOW_HEADERS = default_headers + (
    'enctype',
)

# Database
# https://docs.djangoproject.com/en/1.11/ref/settings/#databases

DATABASES = {

    # 'default': {
    #     'ENGINE': 'django.db.backends.sqlite3',
    #     'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    # }

     #'default': {
     #    'ENGINE': 'django.db.backends.postgresql_psycopg2',
     #    'NAME': 'postgres',
     #    'USER': 'postgres',
     #    'PASSWORD': 'postgres',
     #    'HOST': 'localhost',
     #    'PORT': '5432',
     #}

     'default': {
         'ENGINE': 'django.db.backends.postgresql_psycopg2',
         'NAME': os.environ.get('DB_NAME', 'postgres'),
         'USER': os.environ.get('DB_USERNAME', 'postgres'),
         'PASSWORD': os.environ.get('DB_PASSWORD', 'postgres'),
         'HOST': os.environ.get('DB_HOST', '127.0.0.1'),
         'PORT': os.environ.get('DB_PORT', '5432')
     }
}


# Password validation
# https://docs.djangoproject.com/en/1.11/ref/settings/#auth-password-validators

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


# Internationalization
# https://docs.djangoproject.com/en/1.11/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.11/howto/static-files/

STATIC_URL = '/static/'

STATICFILES_DIRS = (
        os.path.join(BASE_DIR, 'staticfiles'),
    )

STATIC_ROOT = 'static'

COMPRESS_ENABLED = os.environ.get('COMPRESS_ENABLED', not DEBUG)

#DEFAULT_FILE_STORAGE = 'db_file_storage.storage.DatabaseFileStorage'
#AWS_ACCESS_KEY_ID = os.environ.get('ACCESS_KEY', None)
#AWS_SECRET_ACCESS_KEY = os.environ.get('SECRET_KEY', None)
AWS_HOST_NAME = 'us-east-1'
AWS_REGION = 'us-east-1'

AWS_SES_AUTO_THROTTLE = 0.5 # (default; safety factor applied to rate limit, turn off automatic throttling, set this to None)



# add the credentials from IAM and bucket name
AWS_STORAGE_BUCKET_NAME = 'fecfile-filing' # or None if using service role
AWS_STORAGE_UPLOAD_BUCKET_NAME = 'fecfile-filing-uploads' # or None if using service role
#AWS_ACCESS_KEY_ID = '<aws access key >' # or None if using service role
#AWS_SECRET_ACCESS_KEY = '<aws secret access key>'


# if False it will create unique file names for every uploaded file
AWS_S3_FILE_OVERWRITE = False
# the url, that your media and static files will be available at
AWS_S3_CUSTOM_DOMAIN = '%s.s3.amazonaws.com' % AWS_STORAGE_BUCKET_NAME
AWS_S3_CUSTOM_UPLOAD_DOMAIN = '%s.s3.amazonaws.com' % AWS_STORAGE_UPLOAD_BUCKET_NAME

# the sub-directories of media and static files
STATICFILES_LOCATION = 'static'
MEDIAFILES_LOCATION = 'media'

# a custom storage file, so we can easily put static and media in one bucket
DEFAULT_FILE_STORAGE = 'fecfiler.custom_storages.MediaStorage'

# the regular Django file settings but with the custom S3 URLs
MEDIA_URL = "https://%s/%s/" % (AWS_S3_CUSTOM_UPLOAD_DOMAIN, MEDIAFILES_LOCATION)

REST_FRAMEWORK = {
    'DEFAULT_PERMISSION_CLASSES': (
        'rest_framework.permissions.IsAuthenticatedOrReadOnly',
    ),
    'DEFAULT_AUTHENTICATION_CLASSES': (
        'rest_framework_jwt.authentication.JSONWebTokenAuthentication',
        'rest_framework.authentication.SessionAuthentication',
        'rest_framework.authentication.BasicAuthentication',
    ),
}

JWT_AUTH = {
    'JWT_ALLOW_REFRESH': True,
    'JWT_EXPIRATION_DELTA': datetime.timedelta(seconds=3600),
    'JWT_RESPONSE_PAYLOAD_HANDLER':'fecfiler.authentication.views.jwt_response_payload_handler',
}



ADMIN_SHORTCUTS = [
    {
        'shortcuts': [
            {
                'url': '/',
                'open_new_window': True,
            },
             {
                 'url_name': 'admin:authentication_account_changelist',
                 'title': 'Users',
             },
        ]
    },
]


try:
  from .local_settings import *
except:
   pass

"""
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'console': {
            'class': 'logging.StreamHandler',
        },
    },
    'loggers': {
        'django': {
            'handlers': ['console'],
            'level': os.getenv('DJANGO_LOG_LEVEL', 'INFO'),
        },
    },
}
"""
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'formatters': {
        'standard': {
            'format': '%(asctime)s [%(levelname)s] %(name)s: %(message)s'
        },
    },
    'handlers': {
        'console': {
            'level': 'DEBUG',
            'class': 'logging.StreamHandler',
            'formatter': 'standard'
        },
        'default': {
            'level':'DEBUG',
            'class':'logging.handlers.RotatingFileHandler',
            'filename': 'logs/access.log',
            'maxBytes': 1024*1024*5, # 5 MB
            'backupCount': 5,
            'formatter':'standard',
        },
        'request_handler': {
            'level':'DEBUG',
            'class':'logging.handlers.RotatingFileHandler',
            'filename': 'logs/access.log',
            'maxBytes': 1024*1024*5, # 5 MB
            'backupCount': 5,
            'formatter':'standard',
        },
    },
    'loggers': {
        '': {
            'handlers': ['default'],
            'level': 'DEBUG',
            'propagate': True
        },
        'django.request': {
            'handlers': ['request_handler'],
            'level': 'DEBUG',
            'propagate': True
        },
    }
}

#if DEBUG:
    # make all loggers use the console.
for logger in LOGGING['loggers']:
    LOGGING['loggers'][logger]['handlers'] = ['console']




# AWS SES Configuration Settings
#EMAIL_BACKEND = 'django_ses_boto3.ses_email_backend.SESEmailBackend'

AWS_ACCESS_KEY_ID = os.environ.get('ACCESS_KEY', None)
AWS_SECRET_ACCESS_KEY = os.environ.get('SECRET_KEY', None)
AWS_HOST_NAME = 'us-east-1'
AWS_REGION = 'us-east-1'

AWS_SES_AUTO_THROTTLE = 0.5 # (default; safety factor applied to rate limit, turn off automatic throttling, set this to None)



# add the credentials from IAM and bucket name

AWS_STORAGE_BUCKET_NAME = 'dev-efile-repo' # or None if using service role
#AWS_STORAGE_BUCKET_NAME = 'fecfile-filing'

AWS_STORAGE_UPLOAD_BUCKET_NAME = 'dev-efile-upload' # or None if using service role


# if False it will create unique file names for every uploaded file

AWS_S3_FILE_OVERWRITE = False

# the url, that your media and static files will be available at

AWS_S3_CUSTOM_DOMAIN = '%s.s3.amazonaws.com' % AWS_STORAGE_BUCKET_NAME

AWS_S3_CUSTOM_UPLOAD_DOMAIN = '%s.s3.amazonaws.com' % AWS_STORAGE_UPLOAD_BUCKET_NAME



# the sub-directories of media and static files

STATICFILES_LOCATION = 'static'

MEDIAFILES_LOCATION = 'media'



# a custom storage file, so we can easily put static and media in one bucket

DEFAULT_FILE_STORAGE = 'fecfiler.custom_storages.MediaStorage'



# the regular Django file settings but with the custom S3 URLs

MEDIA_URL = "https://%s/%s/" % (AWS_S3_CUSTOM_UPLOAD_DOMAIN, MEDIAFILES_LOCATION)



NXG_FEC_API_URL = "127.0.0.1:8080"
NXG_FEC_API_VERSION = "/api/v1/"
