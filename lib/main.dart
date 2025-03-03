import 'package:flutter/material.dart';
import 'package:flutter_application/chat_page.dart';
import 'package:flutter_application/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: Login(),
      routes: {'/Chat': (context) => Chat()},
    );
  }
}
