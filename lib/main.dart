import 'package:flutter/material.dart';
import 'screens/homePage.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      theme: ThemeData(
        primaryColor: Colors.pink,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
