from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from .models import FarmerQuery
from farmers.models import Farmer
from gemini_integration.client import analyze_text, analyze_media

@csrf_exempt
def submit_query(request):
    if request.method == "POST":
        farmer_id = request.POST.get("farmer_id")
        text = request.POST.get("text")
        audio = request.FILES.get("audio")
        video = request.FILES.get("video")

        farmer = Farmer.objects.get(id=farmer_id)
        query = FarmerQuery.objects.create(farmer=farmer, text=text, audio=audio, video=video)

        if text:
            gemini_out = analyze_text(f"Farmer query: {text}")
        elif audio:
            gemini_out = analyze_media(query.audio.path, "Analyze farmer issue")
        elif video:
            gemini_out = analyze_media(query.video.path, "Analyze farmer issue from video")
        else:
            gemini_out = "No input provided."

        query.gemini_response = gemini_out
        query.save()
        return JsonResponse({"gemini_response": gemini_out})
