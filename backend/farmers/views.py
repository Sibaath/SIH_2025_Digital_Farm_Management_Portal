from django.http import JsonResponse
from django.contrib.auth import authenticate, login
from django.views.decorators.csrf import csrf_exempt
from .models import Farmer
import json

@csrf_exempt
def register(request):
    if request.method == "POST":
        data = json.loads(request.body)
        user = Farmer.objects.create_user(
            username=data["username"],
            email=data["email"],
            password=data["password"],
            mobile=data["mobile"]
        )
        return JsonResponse({"message": "Farmer registered", "id": user.id})

@csrf_exempt
def user_login(request):
    if request.method == "POST":
        data = json.loads(request.body)
        user = authenticate(username=data["username"], password=data["password"])
        if user:
            login(request, user)
            return JsonResponse({"message": "Login successful", "id": user.id})
        return JsonResponse({"error": "Invalid credentials"}, status=400)
