import 'package:flutter/material.dart';

// Allows users to chat with the AI assistant

class AIChatScreen extends StatefulWidget {
  const AIChatScreen({super.key});

  @override
  State<AIChatScreen> createState() => _AIChatScreenState();
}

class _AIChatScreenState extends State<AIChatScreen> {
  // Controller to read user input
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AI Chat")),

      body: Column(
        children: [
          //Chat message area
          Expanded(
            child: ListView(
              children: const [
                ListTile(title: Text("AI: Heloo! How can I help you today")),
              ],
            ),
          ),

          // Message input box
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                // Text field fwhere user types message
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: "Describe your problem...",
                    ),
                  ),
                ),

                // Send button to submit the message
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    print(_messageController.text);
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
