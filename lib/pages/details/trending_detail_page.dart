import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kanimation_playground/utils/animated_gesture_detector.dart';
import 'package:kanimation_playground/utils/animated_opacity_container.dart';

class TrendingDetailPage extends StatelessWidget {
  const TrendingDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height + 500,
      child: AnimatedGestureDetector(
        onTap: () {},
        lowerBound: 0.85,
        onPanUpdateEnabled: true,
        child: Container(
          color: Theme.of(context).primaryColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildTrendingCard(context),
                _buildContent(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTrendingCard(BuildContext context) {
    return Hero(
      tag: 'trending-card',
      child: Container(
        height: MediaQuery.of(context).size.height * 0.75,
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: ClipRRect(
            // borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                _buildParallaxBackground(context),
                _buildStatusLabel(context),
                _buildGradient(),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: _buildTitleAndSubtitle(context),
                ),
                _buildCloseButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildParallaxBackground(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Image.asset(
          'assets/images/freefire-thumb-2.png',
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width - 80,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }

  Widget _buildGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black.withOpacity(0.9)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.4, 0.8],
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
                    color: Colors.white,
                  ),
            ),
            Text(
              'Walk into the Winterlands',
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              'Chilling thrills await in Free Fire',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.white,
                  ),
            ),
            Divider(
              color: Colors.white,
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
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      '10-minute Survival Shooter!',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.white,
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
                            color: Colors.white,
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

  Widget _buildCloseButton(BuildContext context) {
    return Positioned(
      top: 70,
      right: 20,
      child: GestureDetector(
        onTap: () {
          context.go('/');
        },
        child: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.close_rounded,
            color: Colors.white,
            size: 25,
          ),
        ),
      ),
    );
  }

  Widget _buildStatusLabel(BuildContext context) {
    return Positioned(
      top: 70,
      left: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        child: Container(
          height: 30,
          padding: const EdgeInsets.only(left: 8, right: 8),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              'HAPPENING NOW',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return AnimatedOpacityContainer(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'The festive season ',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
              TextSpan(
                text: 'is upon us, and pool game darling ',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.7),
                    ),
              ),
              TextSpan(
                text: '8 Ball Pool ',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.8),
                      fontStyle: FontStyle.italic,
                    ),
              ),
              TextSpan(
                text:
                    'is celebrating with a special holiday event. Unlock the new seasonal cue, take part in new missions and catch lots of offers, such as cue sets and consumables, some discounted by up to 90 per cent',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.8),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
