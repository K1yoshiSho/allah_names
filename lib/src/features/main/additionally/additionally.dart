import 'package:allah_names/src/common/utils/utils.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AdditionallyPage extends StatelessWidget {
  AdditionallyPage({super.key});

  static const String name = "Additionally";
  static const String routePath = "additionally";

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Center(
          child: Text(AppLocalizations.of(context).additinally),
        ));
  }
}

@RoutePage()
class EAdditionallyPage extends AutoRouter {
  const EAdditionallyPage({super.key});
}
