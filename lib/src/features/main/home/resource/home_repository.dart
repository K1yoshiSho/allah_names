import 'dart:convert';

import 'package:allah_names/src/common/models/allah_name.dart';
import 'package:allah_names/src/features/main/home/bloc/home_bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class HomeRepository {
  Future<void> getHKZEvent(GetKZNames event, Emitter<HomeState> emit);

  static getImage(int index) {
    if (index == 1) {
      return 'assets/images/allah.webp';
    } else {
      int temp = index % 10;
      if (temp == 8) {
        temp = 1;
      } else if (temp == 9) {
        temp = 2;
      }
      return 'assets/images/${(temp)}.webp';
    }
  }
}

class BLoCHomeRepository extends HomeRepository {
  @override
  Future<void> getHKZEvent(GetKZNames event, Emitter<HomeState> emit) async {
    try {
      emit(HKZLoadingState());
      final String response = await rootBundle.loadString('assets/json/names_kz.json');
      final data = await json.decode(response);
      emit(HKZFetchedState(namesListKZ: AllahNameKZ.fromList(data)));
    } catch (e) {
      emit(HKZFailureState(message: e.toString()));
    }
  }
}
