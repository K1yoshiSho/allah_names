import 'package:allah_names/src/common/utils/utils.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  static const String name = "Settings";
  static const String routePath = "settings";

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Center(
          child: Text(AppLocalizations.of(context)!.settings),
        ));
  }
}

@RoutePage()
class ESettingsPage extends AutoRouter {
  const ESettingsPage({super.key});
}
