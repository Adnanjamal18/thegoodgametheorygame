import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

import '../widgets/builddragable.dart';
import '../widgets/gameinfo.dart';
import '../widgets/imageWidget.dart';
import 'gameover.dart';

class DragGameScreen extends StatefulWidget {
  @override
  _DragGameScreenState createState() => _DragGameScreenState();
}

class _DragGameScreenState extends State<DragGameScreen> {
  int timeLeft = 60;
  int progress = 1;
  final int maxProgress = 5;
  final List<String> vowels = ['i', 'o', 'u', 'e'];
  String correctLetter = 'i';
  bool showFeedback = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _startNewRound();
    _startTimer();
  }

  void _startNewRound() {
    setState(() {
      correctLetter = vowels[Random().nextInt(vowels.length)];
      showFeedback = false;
    });
  }

  void _handleCorrectDrop() {
    if (progress < maxProgress) {
      setState(() {
        progress++;
        _startNewRound();
      });
    } else {
      timer?.cancel();
      // Navigate to GameOverPage when game ends
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => GameOverPage(score: progress),
        ),
      );
    }
  }


  void _startTimer() {
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      setState(() {
        if (timeLeft > 0) {
          timeLeft--;
        } else {
          t.cancel();
          // When time runs out
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => GameOverPage(score: progress),
            ),
          );
        }
      });
    });
  }


  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> options = List.from(vowels);

    return Scaffold(
      backgroundColor: Color(0xFF6B43C2),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GameInfoHeader(timeLeft: timeLeft, progress: progress, maxProgress: maxProgress),
                ],
              ),
            ),

            Align(
              alignment: Alignment.center,
              child: DraggableImage(letter: correctLetter),
            ),

            if (showFeedback)
              Align(
                alignment: Alignment(0, 0.45),
                child: Text(
                  'Try again!',
                  style: TextStyle(color: Colors.redAccent, fontSize: 20),
                ),
              ),

            Positioned(top: 100, left: 20, child: DropTargetLetter(letter: options[0], onAccept: _onLetterDropped)),
            Positioned(top: 100, right: 20, child: DropTargetLetter(letter: options[1], onAccept: _onLetterDropped)),
            Positioned(bottom: 100, left: 20, child: DropTargetLetter(letter: options[2], onAccept: _onLetterDropped)),
            Positioned(bottom: 100, right: 20, child: DropTargetLetter(letter: options[3], onAccept: _onLetterDropped)),
          ],
        ),
      ),
    );
  }

  void _onLetterDropped(String received) {
    if (received == correctLetter) {
      _handleCorrectDrop();
    } else {
      setState(() => showFeedback = true);
    }

  }
}