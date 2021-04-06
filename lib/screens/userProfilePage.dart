import 'package:chatapp/models/chatUserModel.dart';
import 'package:chatapp/widgets/userProfile.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  final ChatUser chatUser;
  final bool isCurrentUser;

  UserProfilePage({@required this.chatUser, this.isCurrentUser = false});

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      widget.chatUser.time,
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 13),
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
      ),
      body: UserProfile(
        chatUser: widget.chatUser,
        isCurrentUser: widget.isCurrentUser,
      ),
    );
  }
}
