import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// ** NEW: Import the audioplayers package **
import 'package:audioplayers/audioplayers.dart';

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});

  Map<String, dynamic> toJson() {
    return {
      'role': isUser ? 'user' : 'model',
      'text': text,
    };
  }
}

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({super.key});

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = [];
  bool _isProcessing = false;
  // ** NEW: Create an instance of AudioPlayer **
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _textController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  // ** NEW: Function to play audio from base64 data **
  Future<void> playAudio(String base64Audio) async {
    try {
      // The audioplayers package can play directly from a base64 source.
      await _audioPlayer.play(BytesSource(base64Decode(base64Audio)));
      print("Audio playback started.");
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  Future<void> fetchAndPlayTTS(String text) async {
    if (text.trim().isEmpty) return;

    final url = Uri.parse('http://127.0.0.1:8000/text-to-speech');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'text': text}),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final audioData = responseData['audio_data'];
        if (audioData != null) {
          await playAudio(audioData);
        }
      } else {
        print('Failed to fetch audio. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching audio: $e');
    }
  }

  Future<void> sendChatMessage(String message) async {
    if (message.trim().isEmpty) return;

    setState(() {
      _messages.add(ChatMessage(text: message, isUser: true));
      _isProcessing = true;
      _textController.clear();
    });

    final url = Uri.parse('http://127.0.0.1:8000/chat');
    try {
      final historyJson = _messages.map((msg) => msg.toJson()).toList();
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'history': historyJson}),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final aiText = responseData['response'];
        setState(() {
          _messages.add(ChatMessage(text: aiText, isUser: false));
        });
        // ** NEW: After getting the text, fetch and play the audio **
        await fetchAndPlayTTS(aiText);
      } else {
        setState(() {
          _messages.add(
              ChatMessage(text: 'Sorry, something went wrong.', isUser: false));
        });
      }
    } catch (e) {
      setState(() {
        _messages.add(
            ChatMessage(text: 'Could not connect to Sama.', isUser: false));
      });
    } finally {
      setState(() {
        _isProcessing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sama', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return _buildChatMessage(
                    isUser: message.isUser, text: message.text);
              },
            ),
          ),
          if (_isProcessing)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
          _buildTextInputArea(),
        ],
      ),
    );
  }

  Widget _buildChatMessage({required bool isUser, required String text}) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isUser ? Colors.blue.shade600 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isUser ? Colors.white : Colors.black87,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildTextInputArea() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Type your message...',
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
              onSubmitted: sendChatMessage,
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () => sendChatMessage(_textController.text),
            color: Colors.blue.shade600,
          ),
        ],
      ),
    );
  }
}
