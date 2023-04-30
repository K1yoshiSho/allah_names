part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetKZNames extends HomeEvent {}

class GetTRNames extends HomeEvent {}

class GetRUNames extends HomeEvent {}
