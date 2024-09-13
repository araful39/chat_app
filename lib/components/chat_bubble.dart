import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.message, required this.isCurrentUser});
final String message;
final bool isCurrentUser;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 2.5,horizontal: 20),
      decoration: BoxDecoration(
        color: isCurrentUser?Colors.green:Colors.grey,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Text(message,style: TextStyle(color: Colors.white),),
    );
  }
}
