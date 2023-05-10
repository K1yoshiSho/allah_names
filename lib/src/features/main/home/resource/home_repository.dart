import 'dart:convert';

import 'package:allah_names/src/common/models/allah_name.dart';
import 'package:allah_names/src/common/models/names_kz.dart';
import 'package:allah_names/src/features/main/home/bloc/home_bloc.dart';
import 'package:allah_names/src/services/get_it.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_flutter/talker_flutter.dart';

abstract class HomeRepository {
  Future<void> getHEvent(GetNames event, Emitter<HomeState> emit);

  static getImage(int index) {
    try {
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
    } on Exception catch (e, st) {
      getIt<Talker>().handle(e, st);
    }
  }
}

class BLoCHomeRepository extends HomeRepository {
  @override
  Future<void> getHEvent(GetNames event, Emitter<HomeState> emit) async {
    AllahNames allahNames = AllahNames(
      allahNamesEN: [],
      allahNamesKZ: [],
      allahNamesRU: [],
      allahNamesTR: [],
    );
    try {
      emit(HLoadingState());
      final responses = await Future.wait([
        rootBundle.loadString('assets/json/names_kz.json'),
        rootBundle.loadString('assets/json/names_ru.json'),
        rootBundle.loadString('assets/json/names_en.json'),
        rootBundle.loadString('assets/json/names_tr.json'),
      ]);

      final data = await Future.wait(responses.map((response) => compute(parseJsonData, response)));

      allahNames.allahNamesKZ.addAll(AllahName.fromList(data[0]));
      allahNames.allahNamesRU.addAll(AllahName.fromList(data[1]));
      allahNames.allahNamesEN.addAll(AllahName.fromList(data[2]));
      allahNames.allahNamesTR.addAll(AllahName.fromList(data[3]));

      emit(HFetchedState(allahNames: allahNames));
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
      emit(HFailureState(message: e.toString()));
    }
  }
}

dynamic parseJsonData(String jsonString) {
  return json.decode(jsonString);
}
