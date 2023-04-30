import 'package:allah_names/src/common/utils/app_model.dart';
import 'package:allah_names/src/features/main/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';

class HomeModel extends AppModel {
  TextEditingController? textController;
  bool isList = true;
  late HomeBloc bloc;

  @override
  void initState(BuildContext context) {
    bloc = HomeBloc();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    bloc.close();
    textController?.dispose();
  }
}
