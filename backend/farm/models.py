from django.db import models
from farmers.models import Farmer

class Farm(models.Model):
    farmer = models.ForeignKey(Farmer, on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    location = models.CharField(max_length=255)
    livestock_count = models.IntegerField(default=0)
