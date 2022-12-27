import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kanimation_playground/utils/animated_gesture_detector.dart';
import 'package:random_avatar/random_avatar.dart';

import '../../modules/trending/blocs/trending_bloc.dart';
import '../../utils/animated_opacity_container.dart';

class PopularDetailPage extends StatefulWidget {
  const PopularDetailPage({super.key});

  @override
  State<PopularDetailPage> createState() => _PopularDetailPageState();
}

class _PopularDetailPageState extends State<PopularDetailPage> {
  @override
  Widget build(BuildContext context) {
    return _buildPopularCard(context);
  }

  Widget _buildPopularCard(BuildContext context) {
    return Hero(
      tag: 'popular-card',
      child: AnimatedGestureDetector(
        lowerBound: 0.85,
        onPanUpdateEnabled: true,
        onTap: () {},
        child: Container(
          color: Theme.of(context).primaryColor,
          child: SingleChildScrollView(
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 15, 20, 3),
                            child: Text(
                              'LET\'S PLAY',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                    color: Colors.grey,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                            child: Text(
                              'Popular games\nin Vietnam',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      _buildCloseButton(context),
                      const SizedBox(width: 20),
                    ],
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
                    },
                  ),
                  _buildContent(context),
                  const SizedBox(height: 20),
                  _buildContent(context),
                ],
              ),
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

  Widget _buildCloseButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go('/');
      },
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0.5),
              blurRadius: 3,
              spreadRadius: 0.2,
              color: Theme.of(context).dialogBackgroundColor,
            ),
          ],
        ),
        child: Icon(
          Icons.close_rounded,
          color: Theme.of(context).primaryColor,
          size: 25,
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
