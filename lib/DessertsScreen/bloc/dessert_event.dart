part of 'dessert_bloc.dart';

@immutable
sealed class DessertEvent {}

class DessertItemAddToCartEvent extends DessertEvent {
  final Map item;
  DessertItemAddToCartEvent(this.item);
}
