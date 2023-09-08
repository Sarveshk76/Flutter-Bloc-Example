part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

abstract class HomeBlocState extends HomeState {}

class HomeLoadingState extends HomeBlocState {}

class HomeLoadSuccessState extends HomeBlocState {}

class HomeLoadErrorState extends HomeBlocState {}

class NavigateToCartState extends HomeBlocState {}
