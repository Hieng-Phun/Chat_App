import 'package:flutter/material.dart';
import 'package:flutter_application/utils/brand_colors.dart';

class ChatInput extends StatelessWidget {
  const ChatInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(color: const Color.fromARGB(255, 62, 87, 99)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.add, color: Colors.white),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
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
          Icon(Icons.send, color: Colors.white),
        ],
      ),
    );
  }
}
