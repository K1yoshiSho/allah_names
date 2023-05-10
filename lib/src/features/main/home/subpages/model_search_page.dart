import 'package:allah_names/src/common/models/names_kz.dart';
import 'package:allah_names/src/common/utils/app_model.dart';
import 'package:allah_names/src/services/provider/app_provider.dart';
import 'package:flutter/material.dart';

class SearchPageModel extends AppModel {
  TextEditingController? textController;
  bool isList = true;
  List<AllahName> allahNameKZ = [];
  late AppNotifier appProvider;

  @override
  void initState(BuildContext context) {
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController?.dispose();
  }
}
