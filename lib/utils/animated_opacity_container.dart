import 'package:flutter/material.dart';

class AnimatedOpacityContainer extends StatefulWidget {
  final Widget child;
  final Duration? duration;
  const AnimatedOpacityContainer(
      {super.key, required this.child, this.duration});

  @override
  State<AnimatedOpacityContainer> createState() =>
      _AnimatedOpacityContainerState();
}

class _AnimatedOpacityContainerState extends State<AnimatedOpacityContainer> {
  bool showUp = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(widget.duration ?? const Duration(milliseconds: 500), () {
        setState(() {
          showUp = true;
        });
      });
    });
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: showUp ? 1.0 : 0.0,
      curve: Curves.elasticOut,
      duration: const Duration(seconds: 2),
      child: widget.child,
    );
  }
}
