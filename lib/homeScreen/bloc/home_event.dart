part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class NavigateToCartEvent extends HomeEvent {}

class HomeBlocInitialEvent extends HomeEvent {}

class HomeLoadingEvent extends HomeEvent {}

class HomeLoadSuccessEvent extends HomeEvent {}

class HomeErrorEvent extends HomeEvent {}
