import 'package:allah_names/src/common/utils/utils.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class FavouritesPage extends StatelessWidget {
  FavouritesPage({super.key});

  static const String name = "Favourites";
  static const String routePath = "favourites";

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Center(
          child: Text(AppLocalizations.of(context).favourites),
        ));
  }
}

@RoutePage()
class EFavouritesPage extends AutoRouter {
  const EFavouritesPage({super.key});
}
