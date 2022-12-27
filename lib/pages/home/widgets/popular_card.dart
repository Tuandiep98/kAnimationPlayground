import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kanimation_playground/modules/trending/blocs/trending_bloc.dart';
import 'package:kanimation_playground/utils/animated_gesture_detector.dart';
import 'random_image_container.dart';

class PopularCard extends StatelessWidget {
  const PopularCard({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildPopularCard(context);
  }

  Widget _buildPopularCard(BuildContext context) {
    return Hero(
      tag: 'popular-card',
      child: AnimatedGestureDetector(
        onTap: () {
          context.go(context.namedLocation('popular-details'));
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
          RandomImageContainer(number: 11111),
          RandomImageContainer(number: 22222),
          RandomImageContainer(number: 33333),
          RandomImageContainer(number: 44444),
          RandomImageContainer(number: 55555),
          RandomImageContainer(number: 66666),
        ],
        carouselController: controller,
        options: CarouselOptions(
          height: 100,
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
}
