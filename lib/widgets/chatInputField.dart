import 'package:flutter/material.dart';

class ChatInputField extends StatelessWidget {
  const ChatInputField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
      ),
      color: Colors.white,
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.pink[200], width: 2),
                    borderRadius: BorderRadius.circular(24)),
                child: Row(
                  children: [
                    IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        tooltip: "Add emoji",
                        icon: Icon(
                          Icons.insert_emoticon,
                          color: Colors.pink[200],
                        ),
                        onPressed: () {}),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 2,
                        decoration: InputDecoration(
                          hintText: "Type here ...",
                          isDense: true,
                          hintStyle: TextStyle(color: Colors.grey[500]),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        tooltip: "Add image",
                        icon: Icon(
                          Icons.add_a_photo,
                          color: Colors.pink[200],
                        ),
                        onPressed: () {}),
                  ],
                ),
              ),
            ),
            IconButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              tooltip: "Send",
              icon: Icon(
                Icons.send,
                color: Colors.pink,
                size: 32,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
