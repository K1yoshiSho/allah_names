part of 'home_bloc.dart';

/* 
  H - Home
  HKZ - Home Names KZ list
*/

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HInitialState extends HomeState {}

// ---------------------------------- Loading State ----------------------------------

class HKZLoadingState extends HomeState {}

// ---------------------------------- Failure State ----------------------------------

class HKZFailureState extends HomeState {
  final String message;
  const HKZFailureState({required this.message});

  @override
  List<Object> get props => [message];
}

// ---------------------------------- Fetched State ----------------------------------

class HKZFetchedState extends HomeState {
  final List<AllahNameKZ> namesListKZ;

  const HKZFetchedState({required this.namesListKZ});

  @override
  List<Object> get props => [namesListKZ];
}
