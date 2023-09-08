part of 'breakfast_bloc.dart';

@immutable
sealed class BreakfastState {}

final class BreakfastInitial extends BreakfastState {}

abstract class BreakfastBlocState extends BreakfastState {}

class BreakfastItemAddToCartState extends BreakfastBlocState {}
