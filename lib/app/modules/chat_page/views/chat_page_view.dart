import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/const/masseges.dart';

class Message {
  final String sender;
  final String content;
  final String time;
  final bool isSender; // Add this field

  Message({
    required this.sender,
    required this.content,
    required this.time,
    required this.isSender,
  });
}

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Access arguments passed during navigation
    final Community community = Get.arguments;

    // Sample messages for the chat
    final List<Message> messages = [
      Message(sender: 'Agus', content: 'Halo, semua! Ada yang mau berbagi tips?', time: '10:01 AM', isSender: false),
      Message(sender: 'Saya', content: 'Tentu! Penting untuk menjaga pola makan.', time: '10:03 AM', isSender: true),
      Message(sender: 'Supriono', content: 'Saya setuju! Nutrisi yang baik sangat penting.', time: '10:05 AM', isSender: false),
      Message(sender: 'Saya', content: 'Apa ada rencana kegiatan komunitas selanjutnya?', time: '10:10 AM', isSender: true),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(community.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return _buildChatBubble(message);
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildChatBubble(Message message) {
    // Check if the message is sent by the user
    bool isSender = message.isSender;

    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSender ? Colors.pinkAccent : Colors.grey[200],
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: isSender ? Radius.circular(16) : Radius.zero,
            bottomRight: isSender ? Radius.zero : Radius.circular(16),
          ),
        ),
        child: Column(
          crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              message.sender,
              style: TextStyle(fontWeight: FontWeight.bold, color: isSender ? Colors.white : Colors.black),
            ),
            SizedBox(height: 4),
            Text(
              message.content,
              style: TextStyle(color: isSender ? Colors.white : Colors.black),
            ),
            SizedBox(height: 4),
            Text(
              message.time,
              style: TextStyle(color: isSender ? Colors.white70 : Colors.black54, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    final TextEditingController _controller = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Ketik pesan...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              // Logic to send the message would go here
              if (_controller.text.isNotEmpty) {
                // For demonstration, we just clear the input
                _controller.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
