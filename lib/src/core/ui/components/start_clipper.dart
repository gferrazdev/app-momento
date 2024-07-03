import 'package:flutter/material.dart';

class StartClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height); // Começa no canto inferior esquerdo

    // Primeiro segmento Bezier espelhado
    Offset curvePoint1 = Offset(30, size.height * 0.750);
    Offset centerPoint = Offset(size.width * 0.25, size.height * 0.750);
    path.quadraticBezierTo(
        curvePoint1.dx, curvePoint1.dy, centerPoint.dx, centerPoint.dy);

    // Último segmento Bezier espelhado
    Offset curvePoint2 = Offset(size.width, size.height * 0.750);
    Offset endPoint = Offset(size.width, size.height * 0.300);
    path.quadraticBezierTo(
        curvePoint2.dx, curvePoint2.dy, endPoint.dx, endPoint.dy);

    path.lineTo(size.width, 0); // Vai para o canto superior direito
    path.lineTo(0, 0); // Fecha o caminho no canto superior esquerdo
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
