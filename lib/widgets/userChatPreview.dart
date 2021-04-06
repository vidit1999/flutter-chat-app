import 'package:chatapp/models/chatUserModel.dart';
import 'package:chatapp/widgets/singleUserChatPreview.dart';
import 'package:flutter/material.dart';

class UserChatPreview extends StatelessWidget {
  const UserChatPreview({
    Key key,
    @required this.chatUser,
  }) : super(key: key);

  final List<ChatUser> chatUser;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: chatUser.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return SingleUserChatPreview(
          name: chatUser[index].name,
          messageText: chatUser[index].messageText,
          imageUrl: chatUser[index].imageUrl,
          time: chatUser[index].time,
          isMessageRead: chatUser[index].isMessageRead,
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          indent: 16,
          endIndent: 16,
          height: 1,
        );
      },
    );
  }
}
