from django.contrib import admin

from .models import Farmer

# Register your models here.
@admin.register(Farmer)
class FarmerAdmin(admin.ModelAdmin):
    list_display = ("id", "username", "email", "mobile", "is_active", "is_staff")
    search_fields = ("username", "email", "mobile")
