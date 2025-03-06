import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/Models/ChatMessage_entity.dart';

import 'package:flutter_application/Widget/chat_bubble.dart';
import 'package:flutter_application/Widget/chat_input.dart';

// ignore: must_be_immutable
class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<ChatMessageEntity> messages = [];

  _loadEntityMessages() async {
    final respone = await rootBundle.loadString("assets/mock_message.json");
    final List<dynamic> decodeList = jsonDecode(respone) as List;

    final List<ChatMessageEntity> chatMessages =
        decodeList.map((e) => ChatMessageEntity.fromJson(e)).toList();

    setState(() {
      messages = chatMessages;
    });
    // print(chatMessages.length);
  }

  onMessageSend(ChatMessageEntity entity) {
    messages.add(entity);
    setState(() {});
  }

  @override
  void initState() {
    _loadEntityMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black),
        centerTitle: true,
        title: Text("Hi, $username", style: TextStyle(fontSize: 25)),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          // items chat
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ChatBubble(
                  alignment:
                      messages[index].author.name == "Hieng"
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                  entity: messages[index],
                );
              },
            ),
          ),
          // navabar chat input
          ChatInput(onSubmit: onMessageSend),
        ],
      ),
    );
  }
}
