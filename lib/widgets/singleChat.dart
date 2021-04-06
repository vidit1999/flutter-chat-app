import 'package:chatapp/models/chatMessageModel.dart';
import 'package:flutter/material.dart';

class SingleChat extends StatelessWidget {
  final ChatMessage message;

  SingleChat({
    Key key,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Align(
        alignment: message.messageType == "receiver"
            ? Alignment.topLeft
            : Alignment.topRight,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                message.messageContent,
                style: TextStyle(fontSize: 16),
              ),
              Divider(),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  message.messageTime,
                  style: TextStyle(
                    fontSize: 10,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: message.messageType == "receiver"
                    ? Radius.zero
                    : Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: message.messageType == "receiver"
                    ? Radius.circular(20)
                    : Radius.zero),
            color: message.messageType == "receiver"
                ? Colors.grey[200]
                : Colors.pink[50],
          ),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width / 1.5,
          ),
        ),
      ),
    );
  }
}
