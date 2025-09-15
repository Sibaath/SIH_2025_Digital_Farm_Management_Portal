from django.contrib import admin
from django.urls import path
from farmers.views import register, user_login
from farm.views import add_farm, get_farms
from health.views import get_questions, submit_response
from queries.views import submit_query
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path("admin/", admin.site.urls),
    path("auth/register/", register),
    path("auth/login/", user_login),
    path("farms/add/", add_farm),
    path("farms/<int:farmer_id>/", get_farms),
    path("health/questions/", get_questions),
    path("health/submit/", submit_response),
    path("queries/submit/", submit_query),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
