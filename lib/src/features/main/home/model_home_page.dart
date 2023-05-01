import 'package:allah_names/src/common/models/allah_name.dart';
import 'package:allah_names/src/common/utils/app_model.dart';
import 'package:allah_names/src/features/main/home/bloc/home_bloc.dart';
import 'package:allah_names/src/services/provider/app_provider.dart';
import 'package:flutter/material.dart';

class HomeModel extends AppModel {
  TextEditingController? textController;
  bool isList = true;
  List<AllahNameKZ> allahNameKZ = [];
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
