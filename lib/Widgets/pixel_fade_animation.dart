import 'package:flutter/material.dart';
import 'dart:math';

class PixelFadeWidget extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;

  PixelFadeWidget({required this.animation, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return CustomPaint(
          painter: PixelPainter(animation.value),
          child: this.child,
        );
      },
      child: child,
    );
  }
}

class PixelPainter extends CustomPainter {
  final double animationValue;

  PixelPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final random = Random();

    for (int i = 0; i < 100; i++) {
      paint.color = Colors.blue.withOpacity(1.0 - animationValue);
      double x = random.nextDouble() * size.width;
      double y = random.nextDouble() * size.height;
      canvas.drawRect(Rect.fromLTWH(x, y, 5, 5), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
