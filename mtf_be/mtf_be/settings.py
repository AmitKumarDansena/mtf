"""
Django settings for mtf_be project.
"""

from pathlib import Path
import os
import dj_database_url # Import this

# Build paths inside the project like this: BASE_DIR / 'subdir'.
# This path is correct as it goes up two levels (from mtf_be/mtf_be/ to mtf_be/)
BASE_DIR = Path(__file__).resolve().parent.parent


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/5.0/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
# We'll use an environment variable for Vercel
SECRET_KEY = os.environ.get('DJANGO_SECRET_KEY', 'django-insecure-default-key-for-dev')

# Add this for your CSV upload endpoint
CSV_UPLOAD_SECRET = os.environ.get('CSV_UPLOAD_SECRET', 'your-development-secret-key')

# SECURITY WARNING: don't run with debug turned on in production!
# Vercel sets 'VERCEL_ENV' to 'production' automatically
DEBUG = os.environ.get('VERCEL_ENV') != 'production'

# Vercel's domain and localhost are allowed.
# '.vercel.app' allows all Vercel preview domains.
ALLOWED_HOSTS = [
    '127.0.0.1',
    'localhost',
    '.vercel.app'
]


# Application definition

INSTALLED_APPS = [
    "django.contrib.admin",
    "django.contrib.auth",
    "django.contrib.contenttypes",
    "django.contrib.sessions",
    "django.contrib.messages",
    "django.contrib.staticfiles",
    # 3rd Party Apps
    "rest_framework",
    "corsheaders",  # Add this
    # Our local app
    "api",
]

MIDDLEWARE = [
    "django.middleware.security.SecurityMiddleware",
    "corsheaders.middleware.CorsMiddleware",  # Add this (high up)
    "django.contrib.sessions.middleware.SessionMiddleware",
    "django.middleware.common.CommonMiddleware",
    "django.middleware.csrf.CsrfViewMiddleware",
    "django.contrib.auth.middleware.AuthenticationMiddleware",
    "django.contrib.messages.middleware.MessageMiddleware",
    "django.middleware.clickjacking.XFrameOptionsMiddleware",
]

# Add this section for CORS
CORS_ALLOWED_ORIGINS = [
    # This will be your Vercel production domain
    # "https://your-project-name.vercel.app", 
    # This allows all Vercel preview domains
    # "https://*.vercel.app", 
    "http://localhost:8000",
    "http://localhost:3000",
]

# We can be more permissive while developing
CORS_ALLOW_ALL_ORIGINS = True

ROOT_URLCONF = "mtf_be.urls"

TEMPLATES = [
    {
        "BACKEND": "django.template.backends.django.DjangoTemplates",
        "DIRS": [],
        "APP_DIRS": True,
        "OPTIONS": {
            "context_processors": [
                "django.template.context_processors.debug",
                "django.template.context_processors.request",
                "django.contrib.auth.context_processors.auth",
                "django.contrib.messages.context_processors.messages",
            ],
        },
    },
]

# Point Vercel to our WSGI app
WSGI_APPLICATION = "mtf_be.wsgi.application"


# Database
# https://docs.djangoproject.com/en/5.0/ref/settings/#databases
#
# Replace the old sqlite3 DATABASES config with this Vercel Postgres config:
DATABASES = {
    'default': dj_database_url.config(
        # Get the database URL from the POSTGRES_URL environment variable
        default=os.environ.get('POSTGRES_URL'),
        conn_max_age=600,
        ssl_require=True
    )
}


# Password validation
# https://docs.djangoproject.com/en/5.0/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        "NAME": "django.contrib.auth.password_validation.UserAttributeSimilarityValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.MinimumLengthValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.CommonPasswordValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.NumericPasswordValidator",
    },
]


# Internationalization
# https://docs.djangoproject.com/en/5.0/topics/i18n/

LANGUAGE_CODE = "en-us"

TIME_ZONE = "UTC"

USE_I18N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/5.0/howto/static-files/
# This setup is for Vercel to serve static files.
STATIC_URL = "static/"
# This directory is where `collectstatic` will put all static files
STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')

# Default primary key field type
# https://docs.djangoproject.com/en/5.0/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = "django.db.models.BigAutoField"