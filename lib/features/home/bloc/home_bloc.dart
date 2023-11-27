import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloctest/data/cart_items.dart';
import 'package:bloctest/data/grocery_data.dart';
import 'package:bloctest/data/wishlist_items.dart';
import 'package:bloctest/features/home/models/home_product_data_models.dart';
import 'package:bloctest/features/home/ui/home.dart';
// import 'package:bloctest/features/home/ui/home.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 2));
    emit(HomeLoadedSuccessState(
        products: GroceryData.groceryProducts
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList()));
  }
  
  //   FutureOr<void> homeInitialEvent(
  //     HomeInitialEvent event, Emitter<HomeState> emit) async {
  //   emit(HomeLoadingState());
  //   await Future.delayed(Duration(seconds: 2));
  //   emit(HomeLoadedSuccessState(
  //       products: GroceryData.groceryProducts
  //           .map((e) => ProductDataModel(
  //               id: e['id'] ?? '',
  //               name: e['name'] ?? '',
  //               description: e['description'] ?? '',
  //               price: e['price'] ?? '',
  //               imageUrl: e['imageUrl'] ?? ''))
  //           .toList()));
  // }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print('WishList Clicked');
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductItemWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Cart Clicked');
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('Whislist Navigate CLicked');
    emit(HomeNavigatetoWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('Cart Navigate Clicked');
    emit(HomeNavigatetoCartPageActionState());
  }
}
