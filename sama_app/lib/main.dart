import 'package:flutter/material.dart';
import 'conversation_screen.dart';

void main() {
  runApp(const SamaApp());
}

class SamaApp extends StatelessWidget {
  const SamaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sama',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Inter',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Spacer(),
                const Text(
                  'Welcome back, Aarav.',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                const Text(
                  'How are you feeling today?',
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ConversationScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(24),
                    backgroundColor: Colors.blue.shade600,
                    elevation: 5,
                  ),
                  child: const Icon(Icons.mic, color: Colors.white, size: 40),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ConversationScreen()),
                    );
                  },
                  child: Text(
                    'Or, type your check-in',
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
