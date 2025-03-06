import 'package:flutter/material.dart';
import 'package:flutter_application/Models/ChatMessage_entity.dart';
import 'package:flutter_application/utils/brand_colors.dart';

class ChatInput extends StatelessWidget {
  final Function(ChatMessageEntity) onSubmit;
  ChatInput({super.key, required this.onSubmit});

  final chatMessageController = TextEditingController();

  void onSendButtonPressed() {
    final newChatMessages = ChatMessageEntity(
      id: "010",
      text: chatMessageController.text,
      createAt: DateTime.now().millisecondsSinceEpoch,
      author: Author(name: "Hieng"),
    );
    onSubmit(newChatMessages);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(color: Colors.black),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.add, color: Colors.white),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: chatMessageController,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                minLines: 1,
                textCapitalization: TextCapitalization.sentences,
                style: TextStyle(color: Colors.black),
                cursorColor: BrandColors.textColor,
                decoration: InputDecoration(
                  hintText: "Text",
                  hintStyle: TextStyle(color: BrandColors.textColor),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              onSendButtonPressed();
            },
            icon: Icon(Icons.send, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
