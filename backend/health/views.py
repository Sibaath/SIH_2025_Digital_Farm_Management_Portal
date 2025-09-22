from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt

from farm.models import Farm
from .models import HealthQuestion, HealthResponse
from farmers.models import Farmer
from gemini_integration.client import analyze_text, analyze_media
import json

def get_questions(request):
    questions = list(HealthQuestion.objects.all().values())
    return JsonResponse(questions, safe=False)

@csrf_exempt
def submit_response(request):
    if request.method == "POST":
        farm_id = request.POST.get("farm_id")
    
        text = request.POST.get("answer_text")
        print(text)
        audio = request.FILES.get("answer_audio")
        video = request.FILES.get("answer_video")

        farm = Farm.objects.get(id=farm_id)
       

        response = HealthResponse.objects.create(
            farm=farm, 
            answer_text=text, answer_audio=audio, answer_video=video
        )
        print(response)

        question = list(HealthQuestion.objects.all().values())

        questions=""
        
        for q in question:
            questions += q["text"] + " "

        if text:
            prompt = f"""
    You are analyzing a farmer’s response to the following biosecurity questions. 
    Farm type: Pig and Poultry.
    Question: "{questions}"
    Farmer’s response: "{text}"

    Tasks:
    1. Transcribe (if needed) and understand the response.
    2. Check if this response is compliant with standard farm biosecurity protocols 
       (clean water, proper feed, hygiene, disease signs, isolation, etc.).
    3. Answer in JSON with keys:
       - "compliance": Yes/No
       - "explanation": short reason
       - "risk_level": Low/Medium/High
    """
            gemini_out = analyze_text(prompt)
        elif audio:
            prompt = f"""
    You are analyzing a farmer’s audio response to the following biosecurity questions:
    "{questions}"

    Tasks:
    1. Transcribe the audio.
    2. Interpret the answer.
    3. Check against farm biosecurity standards.
    4. Return JSON with compliance, explanation, and risk_level.
    """
            gemini_out = analyze_media(response.answer_audio.path, prompt)
        elif video:
            prompt = f"""
    You are analyzing a farmer’s daily farm inspection video and analyze it against the following set of questions:
    "{questions}"

    Tasks:
    1. Observe and extract answers to the above questions from both visuals and narration.
    2. Match answers to biosecurity protocols.
    3. Return JSON with each question as key, and answer, compliance, risk_level as values.
    """
            gemini_out = analyze_media(response.answer_video.path, prompt)
        else:
            gemini_out = "No input provided."

        response.gemini_response = gemini_out
        response.save()
        return JsonResponse({"gemini_response": gemini_out})
