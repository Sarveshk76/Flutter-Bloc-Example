import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<NavigateToCartEvent>(navigateToCartEvent);
    on<HomeBlocInitialEvent>(homeBlocInitialEvent);
  }

  FutureOr<void> navigateToCartEvent(
      NavigateToCartEvent event, Emitter<HomeState> emit) {
    emit(NavigateToCartState());
  }

  FutureOr<void> homeBlocInitialEvent(
      HomeBlocInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(HomeLoadSuccessState());
  }
}
