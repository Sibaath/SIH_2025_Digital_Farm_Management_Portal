from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from .models import Farm
from farmers.models import Farmer
import json

@csrf_exempt
def add_farm(request):
    if request.method == "POST":
        data = json.loads(request.body)
        farmer = Farmer.objects.get(id=data["farmer_id"])
        farm = Farm.objects.create(
            farmer=farmer, name=data["name"], location=data["location"], livestock_count=data["livestock"]
        )
        return JsonResponse({"message": "Farm added", "farm_id": farm.id})

def get_farms(request, farmer_id):
    farms = list(Farm.objects.filter(farmer_id=farmer_id).values())
    return JsonResponse(farms, safe=False)
