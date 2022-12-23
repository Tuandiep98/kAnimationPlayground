import 'package:flutter/material.dart';

class AnimatedGestureDetector extends StatefulWidget {
  final Function onTap;
  final Widget child;
  const AnimatedGestureDetector(
      {super.key, required this.onTap, required this.child});

  @override
  State<AnimatedGestureDetector> createState() =>
      _AnimatedGestureDetectorState();
}

class _AnimatedGestureDetectorState extends State<AnimatedGestureDetector>
    with TickerProviderStateMixin {
  double scale = 1.0;

  @override
  void initState() {
    scale = 1.0;
    super.initState();
  }

  void _changeScale() {
    setState(() => scale = scale == 1.0 ? 0.95 : 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(),
      onTapCancel: () {
        _changeScale();
      },
      onTapDown: ((details) {
        _changeScale();
      }),
      onTapUp: (details) {
        _changeScale();
      },
      child: AnimatedScale(
        scale: scale,
        duration: const Duration(milliseconds: 120),
        child: widget.child,
      ),
    );
  }
}
