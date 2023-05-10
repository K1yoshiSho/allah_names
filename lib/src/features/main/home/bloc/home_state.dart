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

class HLoadingState extends HomeState {}

// ---------------------------------- Failure State ----------------------------------

class HFailureState extends HomeState {
  final String message;
  const HFailureState({required this.message});

  @override
  List<Object> get props => [message];
}

// ---------------------------------- Fetched State ----------------------------------

class HFetchedState extends HomeState {
  final AllahNames allahNames;

  const HFetchedState({required this.allahNames});

  @override
  List<Object> get props => [allahNames];
}
