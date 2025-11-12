from django.urls import path
from . import views

urlpatterns = [
    # Root of the API, e.g., /api/
    path("", views.api_root, name="api_root"),
    
    # This route will be accessible at /api/hello/
    path("hello/", views.hello_world, name="hello_world"),
    
    # Route for your MTF stocks (now reads from DB)
    path("mtf-stocks/", views.get_mtf_stocks, name="mtf_stocks"),

    # New route for uploading your CSV
    path("upload-csv/", views.upload_csv, name="upload_csv"),
]