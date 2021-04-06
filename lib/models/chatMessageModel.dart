import 'dart:math';

import 'package:flutter/material.dart';

class ChatMessage {
  String messageContent;
  String messageType;
  String messageTime;
  static final _random = Random();

  ChatMessage(
      {@required this.messageContent,
      @required this.messageType,
      @required this.messageTime});

  static ChatMessage getMessage() {
    return ChatMessage(
        messageContent: "Hello World!!",
        messageType: _random.nextBool() ? "receiver" : "sender",
        messageTime: "28 Mar");
  }
}
