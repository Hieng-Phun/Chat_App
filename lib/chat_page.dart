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

  _loadInitialMessages() async {
    final respone = await rootBundle.loadString("assets/mock_message.json");
    final List<dynamic> decodeList = jsonDecode(respone) as List;
    // ignore: non_constant_identifier_names
    final List<ChatMessageEntity> ChatMessages =
        decodeList.map((e) {
          return ChatMessageEntity.fromJson(e);
        }).toList();
    print(ChatMessages.length);
    setState(() {
      messages = ChatMessages;
    });
  }

  @override
  void initState() {
    _loadInitialMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 62, 87, 99),
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
          ChatInput(),
        ],
      ),
    );
  }
}
