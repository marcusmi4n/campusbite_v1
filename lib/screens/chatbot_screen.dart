import 'package:flutter/material.dart';

class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CampusBite Chatbot')),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: const [
                ListTile(title: Text('Bot: Hello! How can I help you today?')),
                ListTile(title: Text('You: Hi, what’s on the menu?')),
                ListTile(
                  title: Text('Bot: Today we have burgers, pizza, and salads!'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    // Handle sending a message
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
