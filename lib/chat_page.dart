import 'package:flutter/material.dart';
import 'package:flutter_application/Widget/chat_bubble.dart';
import 'package:flutter_application/Widget/chat_input.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

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
              itemCount: 10,
              itemBuilder: (context, index) {
                return ChatBubble(
                  alignment:
                      index % 2 == 0
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                  message: "Hello Sir!",
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
