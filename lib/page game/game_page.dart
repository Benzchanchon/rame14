import 'package:flutter/material.dart';

import '../game.dart';

class GamePage extends StatefulWidget {
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final _controller = TextEditingController();
  final _game = Game();
  var feedbackText = '';

  void handleClickGuess() {
    print('Button clicked!');
    print(_controller.text);
    var guess = int.tryParse(_controller.text);
    if (guess == null) {
      setState(() {
        feedbackText = "Error";
      });
    } else {
      var result = _game.doGuess(guess);
      if (result == Result.tooHigh) {
        // ทายมากไป
        print('Too high');
        setState(() {
          feedbackText = "Too hight NT";
        });
      } else if (result == Result.tooLow) {
        // ทายน้อยไป
        print('Too low');
        setState(() {
          feedbackText = "Too low NT";
        });
      } else {
        // ทายถูก
        print('Correct');
        setState(() {
          feedbackText = "nice";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guess the Number'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Please enter number between 1 and 100'),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a number',
              ),
            ),
            // Callback function
            ElevatedButton(
              onPressed: handleClickGuess,
              child: const Text('GUESS'),
            ),
            Text(feedbackText),
            Icon(Icons.content_cut_sharp),
          ],
        ),
      ),
    );
  }
}