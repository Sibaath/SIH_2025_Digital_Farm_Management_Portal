from django.contrib import admin

from .models import HealthQuestion, HealthResponse

# Register your models here.
@admin.register(HealthQuestion)
class HealthQuestionAdmin(admin.ModelAdmin):
    list_display = ("id", "text")
    search_fields = ("text",)


# HealthResponse
@admin.register(HealthResponse)
class HealthResponseAdmin(admin.ModelAdmin):
    list_display = ("id", "farm",  "answer_text", "created_at")
    search_fields = ("answer_text", "transcription", "gemini_response")
    list_filter = ("created_at", "farm")
