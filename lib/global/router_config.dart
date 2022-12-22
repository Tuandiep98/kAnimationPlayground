import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kanimation_playground/pages/details/detail_page.dart';

import '../pages/base_screen.dart';
import '../pages/home/home_page.dart';

final ValueKey<String> scaffoldKey = const ValueKey<String>('App scaffold');

class Routerconfiguration {
  final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => BaseScreen(
          body: HomePage(),
        ),
        routes: <GoRoute>[
          GoRoute(
            name: 'trending-details',
            path: 'trending-details',
            pageBuilder: (BuildContext context, GoRouterState state) =>
                FadeTransitionPage(
              key: scaffoldKey,
              child: BaseScreen(
                body: DetailPage(),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

/// A page that fades in an out.
class FadeTransitionPage extends CustomTransitionPage<void> {
  /// Creates a [FadeTransitionPage].
  FadeTransitionPage({
    required LocalKey key,
    required Widget child,
  }) : super(
            key: key,
            transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) =>
                FadeTransition(
                  opacity: animation.drive(_curveTween),
                  child: child,
                ),
            child: child);

  static final CurveTween _curveTween = CurveTween(curve: Curves.easeIn);
}
