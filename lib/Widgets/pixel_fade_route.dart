import 'package:flutter/material.dart';
import 'package:portfolio/Widgets/pixel_fade_animation.dart';

class PixelFadePageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  PixelFadePageRoute({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return PixelFadeWidget(animation: animation, child: child);
    },
  );
}
