import 'package:flutter/material.dart';
import 'puzzle_screen.dart';
import 'withdraw_screen.dart';
import 'package:audioplayers/audioplayers.dart';

class HomeScreen extends StatelessWidget {
  final AudioPlayer player = AudioPlayer();

  void playClickSound() {
    player.play(AssetSource('sounds/click_sound.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        title: Text('Puzzle Earn Game'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/splash.png', height: 150),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                playClickSound();
                Navigator.push(context, MaterialPageRoute(builder: (context) => PuzzleScreen()));
              },
              child: Text('Start Puzzle'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                playClickSound();
                Navigator.push(context, MaterialPageRoute(builder: (context) => WithdrawScreen()));
              },
              child: Text('Withdraw Balance'),
            ),
          ],
        ),
      ),
    );
  }
}
