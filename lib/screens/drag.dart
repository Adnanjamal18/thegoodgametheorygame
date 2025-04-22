
import 'dart:async';
import 'package:flutter/material.dart';
import '../widgets/imageWidget.dart';
import 'dragsolve.dart';

class DragGamePage extends StatefulWidget {
  @override
  _DragGamePageState createState() => _DragGamePageState();
}

class _DragGamePageState extends State<DragGamePage> {
  String correctLetter = 'i';

  void startGame() {
    Future.delayed(Duration(milliseconds: 500), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DragGameScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6B43C2),
      body: Stack(
        children: [
          Center(
            child: Draggable<String>(
              data: 'start',
              feedback: Opacity(
                opacity: 0.8,
                child: DraggableImage(letter: correctLetter),
              ),
              childWhenDragging: Opacity(opacity: 0.3, child: DraggableImage(letter: correctLetter)),
              child: DraggableImage(letter: correctLetter),
            ),
          ),

          Positioned(
            bottom: 20,
            left: 40,
            child: DragTarget<String>(
              onAcceptWithDetails: (value) {
                // Cancel drag
              },
              builder: (context, candidateData, rejectedData) {
                return Icon(Icons.cancel_outlined, size: 50, color: Colors.white);
              },
            ),
          ),
          Positioned(
            bottom: 20,
            right: 40,
            child: DragTarget<String>(
              onAcceptWithDetails: (value) {
                startGame();
              },
              builder: (context, candidateData, rejectedData) {
                return Icon(Icons.check_circle_outline_outlined, size: 50, color: Colors.white);
              },
            ),
          ),
        ],
      ),
    );
  }
}