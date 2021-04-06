import 'dart:ui';

import 'package:chatapp/models/chatUserModel.dart';
import 'package:chatapp/widgets/chatInputField.dart';
import 'package:chatapp/widgets/singleChat.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/models/chatMessageModel.dart';

class ChatDetailPage extends StatefulWidget {
  final ChatUser chatUser;

  ChatDetailPage({@required this.chatUser});

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  List<ChatMessage> messages =
      List.generate(10, (index) => ChatMessage.getMessage());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: Column(
          children: [Expanded(child: buildListView()), ChatInputField()],
        ));
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: messages.length,
      reverse: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        int reverseIndex = messages.length - index - 1;
        return SingleChat(
          message: messages[reverseIndex],
        );
      },
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.5,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(width: 2),
              CircleAvatar(
                backgroundImage: AssetImage(widget.chatUser.imageUrl),
                maxRadius: 24,
              ),
              SizedBox(width: 16),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.chatUser.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    widget.chatUser.time,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),
                ],
              )),
              Icon(
                Icons.more_vert,
                color: Colors.black54,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
