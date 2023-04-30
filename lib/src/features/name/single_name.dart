import 'package:allah_names/src/common/utils/utils.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SingleNamePage extends StatelessWidget {
  SingleNamePage({super.key});

  static const String name = "Single name";
  static const String routePath = "name";

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Center(
          child: Text("Single Name"),
        ));
  }
}
