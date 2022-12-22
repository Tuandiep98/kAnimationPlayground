import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:random_avatar/random_avatar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CarouselController popularCardController = CarouselController();

  // @override
  // void initState() {
  //   popularCardController.startAutoPlay();
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   popularCardController.stopAutoPlay();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildHeadline(context),
            const SizedBox(height: 3),
            _buildTrendingCard(context),
            const SizedBox(height: 18),
            _buildPopularCard(context),
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
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
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
      child: GestureDetector(
        onTap: () {
          context.go(context.namedLocation('trending-details'));
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                children: [
                  _buildGradient2(),
                  _buildParallaxBackground(context),
                  _buildStatusLabel(context),
                  _buildGradient(),
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
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
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

  Widget _buildGradient2() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black.withOpacity(1)],
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
            const Divider(),
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
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      '10-minute Survival Shooter!',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
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
            color: Colors.black,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(12),
            ),
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

  Widget _buildPopularCard(BuildContext context) {
    return Hero(
      tag: 'popular-card',
      child: Container(
        height: MediaQuery.of(context).size.height * 0.58,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 3),
              child: Text(
                'LET\'S PLAY',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.white60,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
              child: Text(
                'Popular games\nin Vietnam',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Column(
              children: [
                _buildStackImagePerRow(context),
                const SizedBox(height: 3),
                _buildStackImagePerRow(context, viewport: 0.28),
                const SizedBox(height: 3),
                _buildStackImagePerRow(context),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStackImagePerRow(
    BuildContext context, {
    double viewport = 0.26,
  }) {
    return Container(
      child: CarouselSlider(
        items: [
          _buildImageContainer(),
          _buildImageContainer(),
          _buildImageContainer(),
          _buildImageContainer(),
          _buildImageContainer(),
          _buildImageContainer(),
        ],
        options: CarouselOptions(
          height: 120,
          viewportFraction: viewport,
          aspectRatio: 16 / 9,
          autoPlay: true,
          autoPlayInterval: const Duration(milliseconds: 3000),
          autoPlayAnimationDuration: const Duration(milliseconds: 10000),
          enableInfiniteScroll: true,
          autoPlayCurve: Curves.linear,
          padEnds: false,
        ),
      ),
    );
  }

  Widget _buildImageContainer() {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        height: 115,
        width: 115,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
              .withOpacity(1.0),
        ),
        child: randomAvatar(
          (DateTime.now().millisecondsSinceEpoch * Random().nextInt(100))
              .toString(),
          height: 45,
          width: 45,
          trBackground: true,
        ),
      ),
    );
  }
}
