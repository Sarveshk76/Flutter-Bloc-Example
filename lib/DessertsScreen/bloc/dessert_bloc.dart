import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dessert_event.dart';
part 'dessert_state.dart';

class DessertBloc extends Bloc<DessertEvent, DessertState> {
  DessertBloc() : super(DessertInitial()) {
    on<DessertItemAddToCartEvent>(dessertItemAddToCartEvent);
  }

  FutureOr<void> dessertItemAddToCartEvent(
      DessertItemAddToCartEvent event, Emitter<DessertState> emit) {
    print('Product Added to Cart ${event.item['title']}');
  }
}
