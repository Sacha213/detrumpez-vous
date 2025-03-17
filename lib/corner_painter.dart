import 'package:flutter/material.dart';

class CornerPainter extends CustomPainter {
  final Color color;
  final double lineWidth;
  final double cornerLength;
  final double cornerRadius;

  CornerPainter({
    required this.color,
    this.lineWidth = 3.0,
    this.cornerLength = 20.0,
    this.cornerRadius = 8.0, // rayon d'arrondi
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = lineWidth
      ..style = PaintingStyle.stroke;

    // Angle supérieur gauche (inchangé)
    final Path topLeft = Path();
    topLeft.moveTo(cornerLength, 0);
    topLeft.lineTo(cornerRadius, 0);
    topLeft.arcToPoint(
      Offset(0, cornerRadius),
      radius: Radius.circular(cornerRadius),
      clockwise: false,
    );
    topLeft.lineTo(0, cornerLength);
    canvas.drawPath(topLeft, paint);

    // Angle supérieur droit (inchangé)
    final Path topRight = Path();
    topRight.moveTo(size.width - cornerLength, 0);
    topRight.lineTo(size.width - cornerRadius, 0);
    topRight.arcToPoint(
      Offset(size.width, cornerRadius),
      radius: Radius.circular(cornerRadius),
      clockwise: true,
    );
    topRight.lineTo(size.width, cornerLength);
    canvas.drawPath(topRight, paint);

    // Angle inférieur gauche (modifié)
    final Path bottomLeft = Path();
    bottomLeft.moveTo(0, size.height - cornerLength);
    bottomLeft.lineTo(0, size.height - cornerRadius);
    bottomLeft.arcToPoint(
      Offset(cornerRadius, size.height),
      radius: Radius.circular(cornerRadius),
      clockwise: false, // inversé
    );
    bottomLeft.lineTo(cornerLength, size.height);
    canvas.drawPath(bottomLeft, paint);

    // Angle inférieur droit (modifié)
    final Path bottomRight = Path();
    bottomRight.moveTo(size.width, size.height - cornerLength);
    bottomRight.lineTo(size.width, size.height - cornerRadius);
    bottomRight.arcToPoint(
      Offset(size.width - cornerRadius, size.height),
      radius: Radius.circular(cornerRadius),
      clockwise: true, // inversé
    );
    bottomRight.lineTo(size.width - cornerLength, size.height);
    canvas.drawPath(bottomRight, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}