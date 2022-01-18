import 'package:flutter/material.dart';
import './app_screens/screen_app.dart';
import './app_screens/pictureapp.dart';

void main() => runApp(MyFlutterApp());

class MyFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(backgroundColor: Colors.deepOrange, body: firstscreen()),
    );
  }
}
