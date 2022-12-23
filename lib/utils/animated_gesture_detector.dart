import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AnimatedGestureDetector extends StatefulWidget {
  final Function onTap;
  final Widget child;
  final double lowerBound;
  final bool onPanUpdateEnabled;
  const AnimatedGestureDetector({
    super.key,
    required this.onTap,
    required this.child,
    this.lowerBound = 0.95,
    this.onPanUpdateEnabled = false,
  });

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
    setState(() => scale = scale == 1.0 ? widget.lowerBound : 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(),
      onTapCancel: !widget.onPanUpdateEnabled
          ? () {
              _changeScale();
            }
          : null,
      onTapDown: !widget.onPanUpdateEnabled
          ? ((details) {
              _changeScale();
            })
          : null,
      onTapUp: !widget.onPanUpdateEnabled
          ? (details) {
              _changeScale();
            }
          : null,
      onPanUpdate: widget.onPanUpdateEnabled
          ? (details) {
              // Swiping in right direction.
              if (details.delta.dx > 0) {
                setState(() {
                  scale = scale - 0.001;
                });
              }

              // Swiping in left direction.
              if (details.delta.dx < 0) {
                setState(() {
                  scale = scale - 0.001;
                });
              }

              // Swiping in top direction.
              if (details.delta.dy > 0) {
                scale = scale - 0.001;
              }

              // Swiping over the size.
              if (scale <= widget.lowerBound) {
                context.go('/');
              }
            }
          : null,
      onPanEnd: (details) {
        setState(() {
          scale = 1.0;
        });
      },
      child: AnimatedScale(
        scale: scale,
        duration: const Duration(milliseconds: 120),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              scale < 1 ? 12 : 0,
            ),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
