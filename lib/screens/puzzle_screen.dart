import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class PuzzleScreen extends StatefulWidget {
  @override
  _PuzzleScreenState createState() => _PuzzleScreenState();
}

class _PuzzleScreenState extends State<PuzzleScreen> {
  final List<Map<String, String>> puzzles = List.generate(300, (index) => {
    'question': 'Solve Puzzle #${index + 1}: What comes next in the series?',
    'answer': '${index + 2}', // Just example answers, you can update later.
  });

  int currentPuzzle = 0;
  int correctAnswers = 0;
  double earnings = 0.0;
  final TextEditingController answerController = TextEditingController();
  final AudioPlayer player = AudioPlayer();

  void playClickSound() {
    player.play(AssetSource('sounds/click_sound.mp3'));
  }

  void checkAnswer() {
    playClickSound();
    if (answerController.text.trim() == puzzles[currentPuzzle]['answer']) {
      correctAnswers++;
      earnings += 0.25;
    }

    if (currentPuzzle < puzzles.length - 1) {
      setState(() {
        currentPuzzle++;
        answerController.clear();
      });
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Congratulations!'),
          content: Text('You completed all puzzles!\nTotal Earnings: \$${earnings.toStringAsFixed(2)}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    answerController.dispose();
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      appBar: AppBar(
        title: Text('Puzzle ${currentPuzzle + 1}/300'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              puzzles[currentPuzzle]['question'] ?? '',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 30),
            TextField(
              controller: answerController,
              decoration: InputDecoration(
                labelText: 'Your Answer',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: checkAnswer,
              child: Text('Submit'),
            ),
            SizedBox(height: 30),
            Text('Earnings: \$${earnings.toStringAsFixed(2)}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
