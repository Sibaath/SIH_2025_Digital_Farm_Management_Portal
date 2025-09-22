from django.db import models
from farmers.models import Farmer

class FarmerQuery(models.Model):
    farmer = models.ForeignKey(Farmer, on_delete=models.CASCADE)
    text = models.TextField(null=True, blank=True)
    audio = models.FileField(upload_to="queries/audio/", null=True, blank=True)
    video = models.FileField(upload_to="queries/video/", null=True, blank=True)
    transcription = models.TextField(null=True, blank=True)
    gemini_response = models.TextField(null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
