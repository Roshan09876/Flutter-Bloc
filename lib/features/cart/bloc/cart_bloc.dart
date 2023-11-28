import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloctest/data/cart_items.dart';
import 'package:bloctest/features/home/models/home_product_data_models.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) async {
    emit(CartLoadingState());
    await Future.delayed(Duration(seconds: 2));
    emit(CartSuccessState(cartitems: cartItems));
  }

  FutureOr<void> cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {
        cartItems.remove(event.productDataModel);
        emit(CartSuccessState(cartitems: cartItems));
      }
}
