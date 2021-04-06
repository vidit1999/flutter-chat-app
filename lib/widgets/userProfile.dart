import 'package:chatapp/models/chatUserModel.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  final ChatUser chatUser;
  final bool isCurrentUser;

  UserProfile({@required this.chatUser, @required this.isCurrentUser});

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink[50],
      child: ListView(
        children: [
          Column(children: [
            SizedBox(
              height: 20,
            ),
            buildUserProfileImage(isCurrentUser: widget.isCurrentUser),
            SizedBox(
              height: 20,
            ),
            SelectableText(
              widget.chatUser.name,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SelectableText(
              widget.chatUser.email,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
            if (!widget.isCurrentUser)
              Divider(
                indent: 16,
                endIndent: 16,
                thickness: 4,
                color: Colors.pinkAccent,
                height: 50,
              ),
            if (!widget.isCurrentUser) buildProfileButton(icon: Icons.chat),
          ]),
        ],
      ),
    );
  }

  GestureDetector buildProfileButton({IconData icon, Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.pink, width: 2),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Icon(
          icon,
          size: 32,
          color: Colors.pink,
        ),
      ),
    );
  }

  Stack buildUserProfileImage({bool isCurrentUser}) {
    return Stack(alignment: Alignment.bottomRight, children: [
      Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.chatUser.imageUrl),
              fit: BoxFit.cover,
            ),
            border: Border.all(color: Colors.pink, width: 2),
            borderRadius: BorderRadius.circular(100),
          )),
      if (isCurrentUser)
        Positioned(
          right: 10,
          bottom: 10,
          child: buildProfileButton(icon: Icons.photo_camera),
        ),
    ]);
  }
}
