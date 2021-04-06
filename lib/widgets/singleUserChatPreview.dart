import 'package:chatapp/models/chatUserModel.dart';
import 'package:chatapp/screens/userProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/screens/chatDetailPage.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SingleUserChatPreview extends StatefulWidget {
  final String name;
  final String messageText;
  final String imageUrl;
  final String time;
  final bool isMessageRead;

  SingleUserChatPreview(
      {@required this.name,
      @required this.messageText,
      @required this.imageUrl,
      @required this.time,
      @required this.isMessageRead});

  @override
  _SingleUserChatPreviewState createState() => _SingleUserChatPreviewState();
}

class _SingleUserChatPreviewState extends State<SingleUserChatPreview> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableScrollActionPane(),
      actions: [
        IconSlideAction(
          color: Colors.pink[50],
          icon: Icons.delete_forever,
          caption: "Delete",
          onTap: () {},
        ),
        IconSlideAction(
            color: Colors.pink[50],
            icon: Icons.person,
            caption: "User Profile",
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UserProfilePage(
                          chatUser: ChatUser.getUser(),
                          isCurrentUser: false,
                        )))),
        IconSlideAction(
          color: Colors.pink[50],
          icon: Icons.close,
          caption: "Cancel",
          onTap: () {},
        )
      ],
      child: buildListTile(context),
    );
  }

  ListTile buildListTile(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(widget.imageUrl),
          maxRadius: 24,
        ),
        trailing: Text(
          widget.time,
          style: TextStyle(
            fontSize: 12,
            fontWeight:
                widget.isMessageRead ? FontWeight.normal : FontWeight.bold,
          ),
        ),
        title: Text(
          widget.name,
          style: TextStyle(fontSize: 16),
        ),
        subtitle: Text(
          widget.messageText,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey.shade600,
            fontWeight:
                widget.isMessageRead ? FontWeight.normal : FontWeight.bold,
          ),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ChatDetailPage(
              chatUser: ChatUser.getUser(),
            );
          }));
        });
  }
}
