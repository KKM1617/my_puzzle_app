import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyPuzzleApp());
}

class MyPuzzleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Puzzle Earn',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
