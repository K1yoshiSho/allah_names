import 'package:allah_names/src/common/components/navbar.dart';
import 'package:allah_names/src/common/models/allah_name.dart';
import 'package:allah_names/src/features/app/initial_splash_page.dart';
import 'package:allah_names/src/features/main/additionally/additionally.dart';
import 'package:allah_names/src/features/main/favourites/favourites.dart';
import 'package:allah_names/src/features/main/home/home_page.dart';
import 'package:allah_names/src/features/main/home/subpages/search_screen.dart';
import 'package:allah_names/src/features/main/settings/settings_page.dart';
import 'package:allah_names/src/features/single_name/single_name_page.dart';

import 'package:allah_names/src/routes/index.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: SplashScreenRoute.page,
          initial: true,
          maintainState: false,
        ),
        AutoRoute(
          path: '/',
          page: AppNavBarRoute.page,
          children: [
            AutoRoute(
              path: 'names',
              page: EHomeRoute.page,
              children: [
                AutoRoute(
                  path: '',
                  page: HomeRoute.page,
                ),
                AutoRoute(
                  path: ':nameID',
                  page: SingleNameRoute.page,
                ),
                AutoRoute(
                  path: 'search',
                  page: SearchRoute.page,
                )
              ],
            ),
            AutoRoute(
              path: 'favorites',
              page: EFavouritesRoute.page,
              children: [
                AutoRoute(
                  path: '',
                  page: FavouritesRoute.page,
                ),
              ],
            ),
            AutoRoute(
              path: 'additionally',
              page: EAdditionallyRoute.page,
              children: [
                AutoRoute(
                  path: '',
                  page: AdditionallyRoute.page,
                ),
              ],
            ),
            AutoRoute(
              path: 'settings',
              page: ESettingsRoute.page,
              children: [
                AutoRoute(
                  path: '',
                  page: SettingsRoute.page,
                ),
              ],
            ),
          ],
        )
      ];
}
