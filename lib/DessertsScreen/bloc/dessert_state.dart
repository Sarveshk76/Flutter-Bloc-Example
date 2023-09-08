part of 'dessert_bloc.dart';

@immutable
sealed class DessertState {}

final class DessertInitial extends DessertState {}

abstract class DessertBlocState extends DessertState {}

class DessertItemAddToCartState extends DessertBlocState {}
