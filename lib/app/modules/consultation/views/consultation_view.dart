import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';
// import 'package:dash_chat/dash_chat.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:image_picker/image_picker.dart';

class ConsultationView extends StatefulWidget {
  const ConsultationView({super.key});

  @override
  State<ConsultationView> createState() => _ConsultationViewState();
}

class _ConsultationViewState extends State<ConsultationView> {
  late Gemini gemini;
  List<ChatMessage> messages = [];

  ChatUser currentUser = ChatUser(id: "0", firstName: "User");
  ChatUser geminiUser = ChatUser(
    id: "1",
    firstName: "(Lili) Posyandu Lowokwaru",
    profileImage: "assets/bot.png",
  );

  @override
void initState() {
  super.initState();

  // Ensure that the Gemini instance is properly initialized
  gemini = Gemini.init(apiKey: "AIzaSyDtnVsNxXSo_Cil9-EpgOhSDm2vDE28g-4");

   // This line is hypothetical; check your package documentation
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Konsultasi Posyandu Lowokwaru"),
        shape: const Border(bottom: BorderSide(color: Colors.pinkAccent)),
        centerTitle: true,
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return DashChat(

        inputOptions: InputOptions(trailing: [
          IconButton(
            color: Colors.pinkAccent,
              onPressed: _sendMediaMessage, icon: const Icon(Icons.image)),
        ]),
        currentUser: currentUser,
        onSend: _sendMessage,
        messages: messages);
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });

    try {
      String question = chatMessage.text;
      List<Uint8List>? images;
      if (chatMessage.medias?.isNotEmpty ?? false) {
        images = [
          File(chatMessage.medias!.first.url).readAsBytesSync(),
        ];
      }
      gemini.streamGenerateContent(
        question,
        images: images,
      ).listen((event) {
        ChatMessage? lastMessage = messages.firstOrNull;
        if (lastMessage != null && lastMessage.user == geminiUser) {
          lastMessage = messages.removeAt(0);

          String response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";

          lastMessage.text += response;

          setState(() {
            messages = [lastMessage!, ...messages];
          });
        } else {
          String response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";
          ChatMessage message = ChatMessage(
              user: geminiUser, createdAt: DateTime.now(), text: response);

          setState(() {
            messages = [message, ...messages];
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void _sendMediaMessage() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      ChatMessage chatMessage = ChatMessage(
        user: currentUser,
        createdAt: DateTime.now(),
        text: "Deskripsikan gambar",
        medias: [
          ChatMedia(url: file.path, fileName: "", type: MediaType.image)
        ],
      );
      _sendMessage(chatMessage);
    }
  }
}


