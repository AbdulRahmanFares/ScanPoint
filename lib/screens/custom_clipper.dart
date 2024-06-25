import 'package:flutter/material.dart';

class LoginProcessTileClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    final height = size.height;
    final width = size.width;

    Path path = Path();
    path.lineTo(0, height);
    path.lineTo(width, height);
    path.lineTo(width, height * 0.2);
    path.quadraticBezierTo(width * 0.9, height * 0.02, width * 0.6, 0);
    path.close();
    
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class HomeTileClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    final height = size.height;
    final width = size.width;

    Path path = Path();
    path.moveTo(0, height * 0.1);
    path.lineTo(0, height);
    path.lineTo(width, height);
    path.lineTo(width, height * 0.1);
    path.quadraticBezierTo(width * 0.97, height * 0.005, width * 0.9, 0);
    path.lineTo(width * 0.1, 0);
    path.quadraticBezierTo(width * 0.03, height * 0.005, 0, height * 0.1);
    
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

