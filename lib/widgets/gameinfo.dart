import 'package:flutter/material.dart';

class GameInfoHeader extends StatelessWidget {
  final int timeLeft;
  final int progress;
  final int maxProgress;

  const GameInfoHeader({
    required this.timeLeft,
    required this.progress,
    required this.maxProgress,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: 20,
      right: 20,
      child: Column(
        children: [
          Text(
            'Drag the symbol to the correct meaning',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Time Left: ${timeLeft ~/ 60}:${(timeLeft % 60).toString().padLeft(2, '0')}',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              Text(
                'Progress: $progress/$maxProgress',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}