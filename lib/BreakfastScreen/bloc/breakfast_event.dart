part of 'breakfast_bloc.dart';

@immutable
sealed class BreakfastEvent {}

class BreakfastItemAddToCartEvent extends BreakfastEvent {
  final Map item;
  BreakfastItemAddToCartEvent(this.item);
}
