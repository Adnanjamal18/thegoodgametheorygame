import 'package:flutter/material.dart';

class DraggableImage extends StatelessWidget {
  final String letter;

  const DraggableImage({required this.letter});

  @override
  Widget build(BuildContext context) {
    return Draggable<String>(
      data: letter,
      feedback: _buildImage(scale: 0.8),
      childWhenDragging: _buildImage(opacity: 0.3),
      child: _buildImage(),
    );
  }

  Widget _buildImage({double scale = 1.0, double opacity = 1.0}) {
    return Opacity(
      opacity: opacity,
      child: Container(
        width: 180 * scale,
        height: 180 * scale,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          border: Border.all(color: Colors.white, width: 4),
          image: DecorationImage(
            image: AssetImage('assets/images/drag.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}