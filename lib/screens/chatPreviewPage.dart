import 'package:chatapp/widgets/userChatPreview.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/models/chatUserModel.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUser> chatUser = List.generate(10, (index) => ChatUser.getUser());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserChatPreview(chatUser: chatUser),
    );
  }
}
