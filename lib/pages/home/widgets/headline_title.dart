import 'package:flutter/material.dart';

class HeadLineTitle extends StatelessWidget {
  const HeadLineTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildHeadline(context);
  }

  Widget _buildHeadline(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'WENESDAY 21 DECEMBER',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              'Today',
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          child: Image.asset(
            'assets/images/memoji_2.png',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
