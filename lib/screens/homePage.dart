import 'package:chatapp/models/chatUserModel.dart';
import 'package:chatapp/widgets/userProfile.dart';
import 'package:flutter/material.dart';
import 'chatPreviewPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currIndex = 0;

  static List<Widget> _widgetOptions = [
    ChatPage(),
    UserProfile(
      chatUser: ChatUser.getUser(),
      isCurrentUser: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: _widgetOptions.elementAt(_currIndex),
      bottomNavigationBar: buildBottomNavigationBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        tooltip: "Contacts",
        child: Icon(
          Icons.contacts,
          color: Colors.pink,
          size: 32,
        ),
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      selectedFontSize: 12,
      unselectedFontSize: 12,
      backgroundColor: Colors.white,
      elevation: 1,
      currentIndex: _currIndex,
      onTap: (value) {
        setState(() {
          _currIndex = value;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chats"),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: "My Profile",
        ),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0.5,
      title: Text(
        "ChatApp",
        style: TextStyle(
          fontSize: 32,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          splashColor: Colors.transparent,
          onPressed: () {},
          color: Colors.pink,
          tooltip: "Search",
        ),
        IconButton(
          icon: Icon(Icons.person_add),
          splashColor: Colors.transparent,
          onPressed: () {},
          color: Colors.pink,
          tooltip: "Add to Contact",
        ),
        IconButton(
          icon: Icon(Icons.info),
          splashColor: Colors.transparent,
          onPressed: () {},
          color: Colors.pink,
          tooltip: "About",
        ),
        SizedBox(
          width: 8,
        )
      ],
    );
  }
}
