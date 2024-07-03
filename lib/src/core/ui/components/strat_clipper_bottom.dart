import 'package:flutter/material.dart';

class StartClipperBottom extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(size.width, 0); // Começa no canto superior direito

    // Primeiro segmento Bezier espelhado
    Offset curvePoint1 = Offset(size.width - 30, size.height * 0.250);
    Offset centerPoint = Offset(size.width * 0.75, size.height * 0.250);
    path.quadraticBezierTo(
        curvePoint1.dx, curvePoint1.dy, centerPoint.dx, centerPoint.dy);

    // Segundo segmento para criar a subida espelhada

    // Último segmento Bezier espelhado
    Offset curvePoint2 = Offset(0, size.height * 0.250);
    Offset endPoint = Offset(0, size.height * 0.700);
    path.quadraticBezierTo(
        curvePoint2.dx, curvePoint2.dy, endPoint.dx, endPoint.dy);

    path.lineTo(0, size.height); // Vai para o canto inferior esquerdo
    path.lineTo(
        size.width, size.height); // Fecha o caminho no canto inferior direito
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
