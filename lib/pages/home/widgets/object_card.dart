import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kanimation_playground/elements/blur_container.dart';
import 'package:kanimation_playground/utils/animated_gesture_detector.dart';

import 'random_image_container.dart';

class ObjectCard extends StatelessWidget {
  const ObjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildObjectCard(context);
  }

  Widget _buildObjectCard(BuildContext context) {
    return Hero(
      tag: 'object-card',
      child: AnimatedGestureDetector(
        onTap: () {
          context.go(context.namedLocation('object-details'));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0.5),
                  blurRadius: 10,
                  spreadRadius: 7,
                  color: Theme.of(context).dialogBackgroundColor,
                ),
              ],
              image: DecorationImage(
                image: ExactAssetImage('assets/images/tiktok-thumb.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 3),
                    child: Text(
                      'EXPERIENCE IT NOW',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Colors.grey,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                    child: Text(
                      'Subscribe to beloved\nTikTok stars',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  const SizedBox(height: 350),
                  BlurContainer(
                    opacity: 0.7,
                    height: 90,
                    color: Colors.white,
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            width: 80,
                            height: 80,
                            child: RandomImageContainer(number: 99999),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'TikTok-Global\nVideo Community',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              'Short-Form Video Platform',
                              style: Theme.of(context).textTheme.bodyText2!,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  'GET',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'In-App Purchases',
                              style: Theme.of(context).textTheme.labelSmall!,
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
