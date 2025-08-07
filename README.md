<div align="center">
  <h1>🧘 Sama - Your AI Wellness Companion</h1>
  
  <p>
    <strong>An empathetic AI companion designed to provide immediate and private mental wellness support</strong>
  </p>
  
  <p>
    Making expert guidance accessible right when you need it
  </p>

  ![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
  ![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)
  ![FastAPI](https://img.shields.io/badge/FastAPI-005571?style=for-the-badge&logo=fastapi)
  ![MongoDB](https://img.shields.io/badge/MongoDB-%234ea94b.svg?style=for-the-badge&logo=mongodb&logoColor=white)
</div>

---

## 📖 About The Project

In our fast-paced world, many people experience moments of feeling low, stressed, or overwhelmed. Accessing immediate support can be difficult due to cost, stigma, or availability. **Sama** was created to bridge this gap.

Sama is a proactive, privacy-first AI companion that helps you cultivate mental balance. It's not just a tool for when you have a problem; it's a supportive presence that encourages daily wellness habits through a unique blend of modern AI and holistic principles.

> **Note**: Sama is designed to complement, not replace, professional mental health services.

## ✨ Key Features

- 🤖 **Conversational AI**: Natural, supportive conversations with an empathetic AI that remembers your chat history
- 🔊 **Text-to-Speech**: Hear Sama's responses in a calm, soothing voice for a more personal connection
- 🔒 **Privacy-First**: Architected to ensure your thoughts and feelings remain private
- 🎨 **Minimalist UI**: Clean, uncluttered interface designed to create a calming and focused experience
- 📱 **Cross-Platform**: Available on web, mobile, and desktop platforms

## 🛠️ Tech Stack

| Component | Technology |
|-----------|------------|
| **Frontend** | Flutter |
| **Backend** | Python with FastAPI |
| **Database** | MongoDB |
| **AI & NLP** | Google Gemini API |
| **Text-to-Speech** | gTTS |

## 🚀 Getting Started

### Prerequisites

Ensure you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (latest stable version)
- [Python 3.8+](https://www.python.org/downloads/)
- [Git](https://git-scm.com/)
- A code editor like [VS Code](https://code.visualstudio.com/)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/YOUR_USERNAME/sama.git
   cd sama
   ```

2. **Setup the Backend**
   ```bash
   # Navigate to the backend folder
   cd sama_backend
   
   # Install Python packages
   pip install -r requirements.txt
   
   # Set your Gemini API Key
   export GOOGLE_API_KEY="YOUR_API_KEY_HERE"
   
   # Run the server
   uvicorn main:app --reload
   ```

3. **Setup the Frontend**
   ```bash
   # Navigate to the frontend folder in a new terminal
   cd sama_app
   
   # Get Flutter packages
   flutter pub get
   
   # Run the app
   flutter run -d chrome
   ```

### Backend Dependencies

The `requirements.txt` file includes:

```
fastapi
uvicorn[standard]
pydantic
google-generativeai
gTTS
python-dotenv
```

## 📱 Screenshots

*Coming soon! Screenshots will be added as the project develops.*

## 🗺️ Roadmap

- [ ] Enhanced conversation memory
- [ ] Mood tracking and analytics
- [ ] Guided meditation features
- [ ] Multi-language support
- [ ] Mobile app release

## 🤝 Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


## 🙏 Acknowledgments

- [Google Gemini API](https://ai.google.dev/) for powering the AI conversations
- [Flutter](https://flutter.dev/) for the beautiful cross-platform framework
- [FastAPI](https://fastapi.tiangolo.com/) for the robust backend framework
- All contributors and supporters of mental health awareness

---


