import 'package:flutter/material.dart';

import 'drag.dart';

class GameOverPage extends StatelessWidget {
  final int score;

  const GameOverPage({required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6B43C2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Game Over',
              style: TextStyle(fontSize: 32, color: Colors.red, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Your Score: $score',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                //Navigator.of(context).popUntil((route) => route.isFirst); // Back to first page
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return DragGamePage();
                },));
              },
              child: Text('Back to Start'),
            ),
          ],
        ),
      ),
    );
  }
}