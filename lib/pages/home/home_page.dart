import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kanimation_playground/modules/trending/blocs/trending_bloc.dart';
import 'package:random_avatar/random_avatar.dart';

import '../../utils/animated_gesture_detector.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildHeadline(context),
            const SizedBox(height: 5),
            _buildTrendingCard(context),
            const SizedBox(height: 18),
            _buildPopularCard(context),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
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

  Widget _buildTrendingCard(BuildContext context) {
    return Hero(
      tag: 'trending-card',
      child: AnimatedGestureDetector(
        onTap: () {
          context.go(context.namedLocation('trending-details'));
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
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
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(6),
            topRight: Radius.circular(6),
          ),
          child: Image.network(
            'https://docs.flutter.dev/cookbook/img-files/effects/parallax/06-mexico-city.jpg',
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
              Theme.of(context).primaryColor.withOpacity(0.98)
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
              Theme.of(context).primaryColor.withOpacity(1)
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
              style: Theme.of(context).textTheme.bodyText1!,
            ),
            Text(
              'Walk into the Winterlands',
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              'Chilling thrills await in Free Fire',
              style: Theme.of(context).textTheme.bodyText1!,
            ),
            Divider(
              color: Theme.of(context).colorScheme.secondary,
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
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      '10-minute Survival Shooter!',
                      style: Theme.of(context).textTheme.headline6!,
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
                      style: Theme.of(context).textTheme.labelSmall!,
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
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(12),
            ),
          ),
          child: Center(
            child: Text(
              'HAPPENING NOW',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPopularCard(BuildContext context) {
    return Hero(
      tag: 'popular-card',
      child: AnimatedGestureDetector(
        onTap: () {
          context.go(context.namedLocation('popular-details'));
        },
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0.5),
                blurRadius: 10,
                spreadRadius: 7,
                color: Theme.of(context).dialogBackgroundColor,
              ),
            ],
          ),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 3),
                  child: Text(
                    'LET\'S PLAY',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                  child: Text(
                    'Popular games\nin Vietnam',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                BlocBuilder<TrendingBloc, TrendingState>(
                    builder: (context, state) {
                  return Column(
                    children: [
                      _buildStackImagePerRow(
                          state.popularCarouselController, context),
                      const SizedBox(height: 3),
                      _buildStackImagePerRow(
                          state.popularCarouselController, context,
                          reverse: true),
                      const SizedBox(height: 3),
                      _buildStackImagePerRow(
                          state.popularCarouselController, context),
                      const SizedBox(height: 20),
                    ],
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStackImagePerRow(
    CarouselController controller,
    BuildContext context, {
    bool reverse = false,
  }) {
    return Container(
      child: CarouselSlider(
        items: [
          _buildImageContainer(11111),
          _buildImageContainer(22222),
          _buildImageContainer(33333),
          _buildImageContainer(44444),
          _buildImageContainer(55555),
          _buildImageContainer(66666),
        ],
        carouselController: controller,
        options: CarouselOptions(
          height: 120,
          viewportFraction: 0.26,
          aspectRatio: 16 / 9,
          autoPlay: true,
          autoPlayInterval: const Duration(milliseconds: 100),
          autoPlayAnimationDuration: const Duration(milliseconds: 10000),
          enableInfiniteScroll: true,
          autoPlayCurve: Curves.linear,
          padEnds: false,
          reverse: reverse,
        ),
      ),
    );
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
