import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:places_app/features/places/presentation/pages/pages.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const DetailsPage();
          },
        ),
        GoRoute(
          path: 'settings',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              key: state.pageKey,
              transitionDuration: const Duration(milliseconds: 150),
              child: const SettingsPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                final tween = Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero
                ).chain(CurveTween(curve: Curves.easeInOut));
                return SlideTransition(position: animation.drive(tween), child: child,);
              },
            );
          },
        )
      ],
    ),
  ],
);