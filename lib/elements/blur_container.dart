import 'dart:ui';

import 'package:flutter/material.dart';

class BlurContainer extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double opacity;
  final bool enabled;
  final double sigmaX;
  final double sigmaY;
  final double radius;
  final List<BoxShadow>? shadow;
  final bool hasBorder;
  const BlurContainer({
    Key? key,
    required this.child,
    this.color = Colors.grey,
    this.opacity = 0.2,
    this.enabled = true,
    this.sigmaX = 5,
    this.sigmaY = 5,
    this.radius = 0,
    this.shadow,
    this.hasBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return enabled
        ? Container(
            decoration: new BoxDecoration(
              color: color!.withOpacity(opacity),
              boxShadow: shadow != null ? shadow : null,
              border: hasBorder
                  ? Border.all(color: Theme.of(context).colorScheme.secondary)
                  : null,
            ),
            child: new ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: new BackdropFilter(
                filter: new ImageFilter.blur(
                  sigmaX: sigmaX,
                  sigmaY: sigmaY,
                  tileMode: TileMode.decal,
                ),
                child: child,
              ),
            ),
          )
        : Container(child: child);
  }
}
