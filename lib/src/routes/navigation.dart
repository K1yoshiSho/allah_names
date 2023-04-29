import 'package:flutter/material.dart';
import 'index.dart';
import 'package:go_router/go_router.dart';
export 'package:go_router/go_router.dart';

const transitionInfoKey = '__transition_info__';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

GoRouter createRouter() => GoRouter(
      initialLocation: HomePage.routeName,
      debugLogDiagnostics: true,
      navigatorKey: navigatorKey,
      errorBuilder: (context, _) => const ErrorPage(),
      routes: [
        GoRoute(
          name: HomePage.name,
          path: HomePage.routeName,
          builder: (context, _) => const HomePage(),
          routes: [],
        ),
      ],
    );
