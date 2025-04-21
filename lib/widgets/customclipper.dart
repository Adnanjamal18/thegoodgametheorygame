import 'package:flutter/material.dart';
class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width / 2, 0); // top center
    path.lineTo(0, size.height);    // bottom left
    path.lineTo(size.width, size.height); // bottom right
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


