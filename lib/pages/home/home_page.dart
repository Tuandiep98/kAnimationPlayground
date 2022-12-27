import 'package:flutter/material.dart';
import 'package:kanimation_playground/pages/home/widgets/popular_card.dart';
import 'package:kanimation_playground/pages/home/widgets/trending_card.dart';
import 'widgets/headline_title.dart';
import 'widgets/object_card.dart';

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
            HeadLineTitle(),
            const SizedBox(height: 5),
            TrendingCard(),
            const SizedBox(height: 18),
            PopularCard(),
            const SizedBox(height: 18),
            ObjectCard(),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
