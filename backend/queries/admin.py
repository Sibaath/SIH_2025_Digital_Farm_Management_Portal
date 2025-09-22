from django.contrib import admin

from .models import FarmerQuery

# Register your models here.

@admin.register(FarmerQuery)
class FarmerQueryAdmin(admin.ModelAdmin):
    list_display = ("id", "farmer", "text", "created_at")
    search_fields = ("text", "transcription", "gemini_response", "farmer__username")
    list_filter = ("created_at",)