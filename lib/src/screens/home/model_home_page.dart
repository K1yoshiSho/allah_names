import 'package:allah_names/src/common/utils/app_model.dart';
import 'package:flutter/material.dart';

class HomeModel extends AppModel {
  TextEditingController? textController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textController?.dispose();
  }
}
