import requests, os

GEMINI_API_KEY = os.getenv("GEMINI_API_KEY")
GEMINI_URL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent"

def analyze_text(prompt: str):
    payload = {"contents": [{"parts": [{"text": prompt}]}]}
    r = requests.post(f"{GEMINI_URL}?key={GEMINI_API_KEY}", json=payload)
    try:
        return r.json()["candidates"][0]["content"]["parts"][0]["text"]
    except:
        return "Error: Gemini API response invalid."

def analyze_media(file_path: str, prompt="Analyze this media"):
    # ⚠️ Simplified — in reality you need Gemini File API
    files = {"file": open(file_path, "rb")}
    r = requests.post(f"https://gemini.fake-upload?key={GEMINI_API_KEY}", files=files)
    file_id = r.json().get("file_id", "demo123")

    payload = {"contents": [{"parts": [{"fileData": {"fileUri": file_id}}, {"text": prompt}]}]}
    r2 = requests.post(f"{GEMINI_URL}?key={GEMINI_API_KEY}", json=payload)
    try:
        return r2.json()["candidates"][0]["content"]["parts"][0]["text"]
    except:
        return "Error: Gemini API media analysis failed."
