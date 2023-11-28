part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

abstract class WishlistActionState extends WishlistState{}

class WishlistInitial extends WishlistState {}

class WishListSuccessState extends WishlistState{
  final List<ProductDataModel> wishlistItems;

  WishListSuccessState({required this.wishlistItems});
}

