import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';

class RandomImageContainer extends StatelessWidget {
  final double number;
  const RandomImageContainer({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return _buildImageContainer(number);
  }

  Widget _buildImageContainer(double random) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        height: 115,
        width: 115,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Color((random * 0xFFFFFF).toInt()).withOpacity(1.0),
        ),
        child: randomAvatar(
          random.toString(),
          height: 45,
          width: 45,
          trBackground: true,
        ),
      ),
    );
  }
}
