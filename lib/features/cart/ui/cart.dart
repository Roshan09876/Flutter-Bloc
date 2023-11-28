import 'package:bloctest/features/cart/bloc/cart_bloc.dart';
import 'package:bloctest/features/cart/ui/cart_tile_widget.dart';
import 'package:bloctest/features/home/ui/product_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  final CartBloc cartBloc = CartBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Items'),
        backgroundColor: Colors.teal,
      ),
      bottomSheet: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartLoadingState:
              return Scaffold(
                body: CircularProgressIndicator(),
              );

            case CartSuccessState:
              final successState = state as CartSuccessState;
              return ListView.builder(
                  itemCount: successState.cartitems.length,
                  itemBuilder: (context, index) {
                    return CartTileWidget(
                        cartBloc: cartBloc,
                        productDataModel: successState.cartitems[index]);
                  });
          }
          return Container();
        },
      ),
    );
  }
}
