import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloctest/data/wishlist_items.dart';
import 'package:bloctest/features/home/models/home_product_data_models.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent> (wishListInitiaEvent);
  }

  FutureOr<void> wishListInitiaEvent(WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishListSuccessState(wishlistItems: wishlistItems));
  }
}
