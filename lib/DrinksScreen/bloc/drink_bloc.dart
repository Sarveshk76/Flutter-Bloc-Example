import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'drink_event.dart';
part 'drink_state.dart';

class DrinkBloc extends Bloc<DrinkEvent, DrinkState> {
  DrinkBloc() : super(DrinkInitial()) {
    on<DrinkItemsAddToCartEvent>(drinkItemsAddToCartEvent);
  }

  FutureOr<void> drinkItemsAddToCartEvent(
      DrinkItemsAddToCartEvent event, Emitter<DrinkState> emit) {
    print('Product added to cart ${event.item['title']}');
  }
}
