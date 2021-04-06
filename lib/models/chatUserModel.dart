import 'dart:math';

import 'package:flutter/material.dart';

class ChatUser {
  String name;
  String email;
  String messageText;
  String imageUrl;
  String time;
  bool isMessageRead;
  static final _random = Random();

  ChatUser(
      {@required this.name,
      @required this.email,
      @required this.messageText,
      @required this.imageUrl,
      @required this.time,
      @required this.isMessageRead});

  static getUser() {
    return ChatUser(
        name: "John Doe",
        email: "johndoe@email.com",
        messageText: "Hello world!!",
        imageUrl: "images/test_user.jpg",
        time: "28 Mar",
        isMessageRead: _random.nextBool());
  }
}
