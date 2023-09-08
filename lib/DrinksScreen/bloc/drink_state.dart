part of 'drink_bloc.dart';

@immutable
sealed class DrinkState {}

final class DrinkInitial extends DrinkState {}

abstract class DrinkBlocState extends DrinkState {}

class DrinkItemAddToCartState extends DrinkState {}
