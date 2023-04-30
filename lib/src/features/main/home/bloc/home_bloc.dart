import 'package:allah_names/src/common/models/allah_name.dart';
import 'package:allah_names/src/features/main/home/resource/home_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BLoCHomeRepository _repository = BLoCHomeRepository();
  HomeBloc() : super(HInitialState()) {
    on<GetKZNames>(_repository.getHKZEvent);
  }
}
