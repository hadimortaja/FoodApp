import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/main_screen.dart';

import 'homescreen.dart';
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    title: "Food delivery App",
      theme: ThemeData(
        primaryColor: Colors.blueAccent
      ),
      home: MainScreen(),
    );
  }
}
