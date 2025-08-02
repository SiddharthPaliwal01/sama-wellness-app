Sama - Your AI Wellness Companion
An empathetic AI companion designed to provide immediate and private mental wellness support, making expert guidance accessible right when you need it.

About The Project
In our fast-paced world, many people experience moments of feeling low, stressed, or overwhelmed. Accessing immediate support can be difficult due to cost, stigma, or availability. Sama was created to bridge this gap.

Sama is a proactive, privacy-first AI companion that helps you cultivate mental balance. It's not just a tool for when you have a problem; it's a supportive presence that encourages daily wellness habits through a unique blend of modern AI and holistic principles.

Key Features
Conversational AI: Have natural, supportive conversations with an empathetic AI that remembers your chat history.

Text-to-Speech: Hear Sama's responses in a calm, soothing voice for a more personal connection.

Privacy-First: Architected to ensure your thoughts and feelings remain private.

Minimalist UI: A clean, uncluttered interface designed to create a calming and focused experience.

Tech Stack
This project is built with a modern, cross-platform technology stack:

Frontend: Flutter

Backend: Python with FastAPI

Database: MongoDB

AI & NLP: Google Gemini API

Text-to-Speech: gTTS

Getting Started
To get a local copy up and running, follow these simple steps.

Prerequisites
Make sure you have the following installed on your system:

Flutter SDK

Python 3.8+

A code editor like VS Code

Installation
Clone the repo

git clone https://github.com/YOUR_USERNAME/YOUR_REPOSITORY_NAME.git
cd YOUR_REPOSITORY_NAME

Setup the Backend

# Navigate to the backend folder
cd sama_backend

# Install Python packages
pip install -r requirements.txt

# Set your Gemini API Key
export GOOGLE_API_KEY="YOUR_API_KEY_HERE"

# Run the server
uvicorn main:app --reload

(Note: You will need to create a requirements.txt file. See instructions below.)

Setup the Frontend

# Navigate to the frontend folder in a new terminal
cd sama_app

# Get Flutter packages
flutter pub get

# Run the app
flutter run -d chrome

Creating the requirements.txt file
For the backend to be easily set up by others, it's best practice to have a requirements.txt file.

In your sama_backend folder, create a file named requirements.txt.

Paste the following lines into it:

fastapi
uvicorn[standard]
pydantic
google-generativeai
gTTS
python-dotenv

Now, the pip install -r requirements.txt command will work perfectly.

