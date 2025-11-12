"""
Main URL configuration for the mtf_be project.
"""
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    # Django admin (optional, but good to have)
    path("admin/", admin.site.urls),
    
    # This is the crucial line:
    # It routes all requests starting with 'api/'
    # to your app's 'api.urls' file.
    path("api/", include("api.urls")),
]