part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

abstract class CartActionState extends CartState{}

class CartInitial extends CartState{}

class CartLoadingState extends CartState{}

class CartSuccessState extends CartState{
  final List<ProductDataModel> cartitems;

  CartSuccessState({required this.cartitems});
}

