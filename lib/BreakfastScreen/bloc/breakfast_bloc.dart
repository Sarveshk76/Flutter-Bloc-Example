import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'breakfast_event.dart';
part 'breakfast_state.dart';

class BreakfastBloc extends Bloc<BreakfastEvent, BreakfastState> {
  BreakfastBloc() : super(BreakfastInitial()) {
    on<BreakfastItemAddToCartEvent>(breakfastItemAddToCartEvent);
  }

  FutureOr<void> breakfastItemAddToCartEvent(
      BreakfastItemAddToCartEvent event, Emitter<BreakfastState> emit) {
    print('Product Added to Cart ${event.item['title']}');
  }
}
