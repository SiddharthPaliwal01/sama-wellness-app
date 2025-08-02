import os
import io
import base64
import google.generativeai as genai
from fastapi import FastAPI
from pydantic import BaseModel
from fastapi.middleware.cors import CORSMiddleware
from typing import List
# NEW: Import gTTS for text-to-speech and other helpers
from gtts import gTTS
from fastapi.responses import JSONResponse

# --- Model for a single chat message ---
class ChatMessage(BaseModel):
    role: str # "user" or "model"
    text: str

# --- Model for Chat Request ---
class ChatRequest(BaseModel):
    history: List[ChatMessage]

# --- NEW: Model for Text-to-Speech Request ---
class TTSRequest(BaseModel):
    text: str

# Configure Gemini API
api_key = os.getenv("GOOGLE_API_KEY")
if not api_key:
    raise ValueError("GOOGLE_API_KEY environment variable not set.")

genai.configure(api_key=api_key)
model = genai.GenerativeModel('gemini-1.5-flash')

app = FastAPI()

origins = ["*"]
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
def read_root():
  return {"message": "Sama Backend is running!"}

@app.post("/chat")
def handle_chat(request: ChatRequest):
    try:
        conversation_history = [{'role': msg.role, 'parts': [{'text': msg.text}]} for msg in request.history]
        chat = model.start_chat(history=conversation_history)
        last_message = conversation_history[-1]['parts'][0]['text']
        prompt = f"You are Sama, a calm and empathetic wellness companion. Continue the conversation naturally and concisely. The user just said: '{last_message}'"
        ai_response = chat.send_message(prompt)
        return {"response": ai_response.text}
    except Exception as e:
        print(f"An error occurred in /chat: {e}")
        return JSONResponse(status_code=500, content={"response": "Sorry, I'm having trouble thinking right now."})

# --- NEW: TEXT-TO-SPEECH ENDPOINT ---
@app.post("/text-to-speech")
def handle_tts(request: TTSRequest):
    """
    Receives text and converts it into speech, returning the audio data.
    """
    try:
        print(f"Generating audio for: {request.text}")
        # Create a gTTS object with the text, using a calm voice
        tts = gTTS(text=request.text, lang='en', tld='co.in', slow=False)
        
        # Save the audio to an in-memory file
        mp3_fp = io.BytesIO()
        tts.write_to_fp(mp3_fp)
        mp3_fp.seek(0) # Go to the beginning of the in-memory file

        # Encode the audio data to base64
        audio_base64 = base64.b64encode(mp3_fp.read()).decode('utf-8')
        
        return {"audio_data": audio_base64}
    except Exception as e:
        print(f"An error occurred in /text-to-speech: {e}")
        return JSONResponse(status_code=500, content={"error": "Failed to generate audio."})
