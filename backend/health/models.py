from django.db import models
from farm.models import Farm
from farmers.models import Farmer

class HealthQuestion(models.Model):
    text = models.TextField()

class HealthResponse(models.Model):
    farm = models.ForeignKey(Farm, on_delete=models.CASCADE, null=True, blank=True)
    answer_text = models.TextField(null=True, blank=True)
    answer_audio = models.FileField(upload_to="audio/", null=True, blank=True)
    answer_video = models.FileField(upload_to="video/", null=True, blank=True)
    transcription = models.TextField(null=True, blank=True)
    gemini_response = models.TextField(null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
