import requests, os

GEMINI_API_KEY = ''
GEMINI_URL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent"


def analyze_text(prompt: str):
    payload = {
        "contents": [{"role": "user", "parts": [{"text": prompt}]}]
    }
    r = requests.post(f"{GEMINI_URL}?key={GEMINI_API_KEY}", json=payload)
    print("STATUS:", r.status_code)
    print("RESPONSE:", r.text)  # 👈 this shows you the real issue
    try:
        data = r.json()
        return data["candidates"][0]["content"]["parts"][0]["text"]
    except Exception as e:
        return f"Error: {data.get('error', str(e))}"


def analyze_media(file_path: str, prompt="Analyze this media"):
    # 1. Upload file to Gemini File API
    upload_url = f"https://generativelanguage.googleapis.com/upload/v1beta/files?key={GEMINI_API_KEY}"
    with open(file_path, "rb") as f:
        r = requests.post(upload_url, files={"file": f})
    if r.status_code != 200:
        return f"Upload error: {r.text}"

    file_data = r.json()
    file_uri = file_data.get("file", {}).get("uri")
    if not file_uri:
        return f"Upload failed: {file_data}"

    # 2. Generate content with file reference
    payload = {
        "contents": [{
            "role": "user",
            "parts": [
                {"fileData": {"fileUri": file_uri}},
                {"text": prompt}
            ]
        }]
    }
    gen_url = f"https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key={GEMINI_API_KEY}"
    r2 = requests.post(gen_url, json=payload)

    try:
        data = r2.json()
        return data["candidates"][0]["content"]["parts"][0]["text"]
    except Exception as e:
        return f"Error: {data if 'data' in locals() else str(e)}"
