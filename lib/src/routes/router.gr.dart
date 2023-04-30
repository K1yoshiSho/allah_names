// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AppNavBarRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AppNavBarPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    EHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EHomePage(),
      );
    },
    SettingsRoute.name: (routeData) {
      final args = routeData.argsAs<SettingsRouteArgs>(orElse: () => const SettingsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SettingsPage(key: args.key),
      );
    },
    ESettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ESettingsPage(),
      );
    },
    SingleNameRoute.name: (routeData) {
      final args = routeData.argsAs<SingleNameRouteArgs>(orElse: () => const SingleNameRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SingleNamePage(key: args.key),
      );
    },
    AdditionallyRoute.name: (routeData) {
      final args = routeData.argsAs<AdditionallyRouteArgs>(orElse: () => const AdditionallyRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AdditionallyPage(key: args.key),
      );
    },
    EAdditionallyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EAdditionallyPage(),
      );
    },
    FavouritesRoute.name: (routeData) {
      final args = routeData.argsAs<FavouritesRouteArgs>(orElse: () => const FavouritesRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FavouritesPage(key: args.key),
      );
    },
    EFavouritesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EFavouritesPage(),
      );
    },
  };
}

/// generated route for
/// [AppNavBarPage]
class AppNavBarRoute extends PageRouteInfo<void> {
  const AppNavBarRoute({List<PageRouteInfo>? children})
      : super(
          AppNavBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppNavBarRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EHomePage]
class EHomeRoute extends PageRouteInfo<void> {
  const EHomeRoute({List<PageRouteInfo>? children})
      : super(
          EHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'EHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<SettingsRouteArgs> {
  SettingsRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SettingsRoute.name,
          args: SettingsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<SettingsRouteArgs> page = PageInfo<SettingsRouteArgs>(name);
}

class SettingsRouteArgs {
  const SettingsRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SettingsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ESettingsPage]
class ESettingsRoute extends PageRouteInfo<void> {
  const ESettingsRoute({List<PageRouteInfo>? children})
      : super(
          ESettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ESettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SingleNamePage]
class SingleNameRoute extends PageRouteInfo<SingleNameRouteArgs> {
  SingleNameRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SingleNameRoute.name,
          args: SingleNameRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SingleNameRoute';

  static const PageInfo<SingleNameRouteArgs> page = PageInfo<SingleNameRouteArgs>(name);
}

class SingleNameRouteArgs {
  const SingleNameRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SingleNameRouteArgs{key: $key}';
  }
}

/// generated route for
/// [AdditionallyPage]
class AdditionallyRoute extends PageRouteInfo<AdditionallyRouteArgs> {
  AdditionallyRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AdditionallyRoute.name,
          args: AdditionallyRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AdditionallyRoute';

  static const PageInfo<AdditionallyRouteArgs> page = PageInfo<AdditionallyRouteArgs>(name);
}

class AdditionallyRouteArgs {
  const AdditionallyRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'AdditionallyRouteArgs{key: $key}';
  }
}

/// generated route for
/// [EAdditionallyPage]
class EAdditionallyRoute extends PageRouteInfo<void> {
  const EAdditionallyRoute({List<PageRouteInfo>? children})
      : super(
          EAdditionallyRoute.name,
          initialChildren: children,
        );

  static const String name = 'EAdditionallyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FavouritesPage]
class FavouritesRoute extends PageRouteInfo<FavouritesRouteArgs> {
  FavouritesRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          FavouritesRoute.name,
          args: FavouritesRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'FavouritesRoute';

  static const PageInfo<FavouritesRouteArgs> page = PageInfo<FavouritesRouteArgs>(name);
}

class FavouritesRouteArgs {
  const FavouritesRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'FavouritesRouteArgs{key: $key}';
  }
}

/// generated route for
/// [EFavouritesPage]
class EFavouritesRoute extends PageRouteInfo<void> {
  const EFavouritesRoute({List<PageRouteInfo>? children})
      : super(
          EFavouritesRoute.name,
          initialChildren: children,
        );

  static const String name = 'EFavouritesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
