import 'package:flutter/material.dart';

class MainClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var radius = 60.0;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height - radius * 3);
    path.quadraticBezierTo(
        0, size.height - radius * 2, radius, size.height - radius * 2);
    path.lineTo(size.width - radius, size.height - radius * 2);
    path.quadraticBezierTo(
        size.width, size.height - radius * 2, size.width, size.height - radius);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
