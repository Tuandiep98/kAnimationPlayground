import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kanimation_playground/elements/blur_container.dart';
import 'package:kanimation_playground/utils/animated_gesture_detector.dart';

class TrendingCard extends StatelessWidget {
  const TrendingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildTrendingCard(context);
  }

  Widget _buildTrendingCard(BuildContext context) {
    return Hero(
      tag: 'trending-card',
      child: AnimatedGestureDetector(
        onTap: () {
          context.go(context.namedLocation('trending-details'));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.65,
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
            ),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Stack(
                children: [
                  _buildGradient2(context),
                  _buildParallaxBackground(context),
                  _buildStatusLabel(context),
                  _buildGradient(context),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: _buildTitleAndSubtitle(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildParallaxBackground(BuildContext context) {
    return Positioned.fill(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 2),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(6),
            topRight: Radius.circular(6),
          ),
          child: Image.asset(
            'assets/images/freefire-thumb-2.png',
            height: MediaQuery.of(context).size.height * 0.55,
            width: MediaQuery.of(context).size.width - 40,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
        ),
      ),
    );
  }

  Widget _buildGradient(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              Theme.of(context).colorScheme.secondary.withOpacity(0.98)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.4, 0.8],
          ),
        ),
      ),
    );
  }

  Widget _buildGradient2(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              Theme.of(context).colorScheme.secondary.withOpacity(1)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.8, 0.3],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndSubtitle(BuildContext context) {
    return Positioned(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'FEATURED',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            Text(
              'Walk into the Winterlands',
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              'Chilling thrills await in Free Fire',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            Divider(
              color: Theme.of(context).primaryColor,
              thickness: 0.1,
            ),
            Row(
              children: [
                CircleAvatar(
                  child: Image.asset(
                    'assets/images/memoji_2.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Garena Free Fire: Winterlands',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      '10-minute Survival Shooter!',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
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
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'In-App Purchases',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStatusLabel(BuildContext context) {
    return Positioned(
      top: 0,
      left: -10,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        child: Container(
          height: 30,
          padding: const EdgeInsets.only(left: 8, right: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(12),
            ),
          ),
          child: Center(
            child: Text(
              'HAPPENING NOW',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
