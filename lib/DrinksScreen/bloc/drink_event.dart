part of 'drink_bloc.dart';

@immutable
sealed class DrinkEvent {}

class DrinkItemsAddToCartEvent extends DrinkEvent {
  final Map item;
  DrinkItemsAddToCartEvent(this.item);
}
