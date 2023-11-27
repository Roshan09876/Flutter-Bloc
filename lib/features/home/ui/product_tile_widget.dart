import 'package:bloctest/features/home/bloc/home_bloc.dart';
import 'package:bloctest/features/home/models/home_product_data_models.dart';
import 'package:flutter/material.dart';

class ProjectTileWidget extends StatelessWidget {
  final HomeBloc homeBloc;
  final ProductDataModel productDataModel;
  const ProjectTileWidget(
      {super.key, required this.productDataModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 200,
          width: double.maxFinite,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(productDataModel.imageUrl))),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          productDataModel.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text(productDataModel.description),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("\$ " + productDataModel.price.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    homeBloc.add(HomeProductWishlistButtonClickedEvent(
                      clickedProduct: productDataModel
                    ));
                  },
                  icon: Icon(
                    Icons.favorite_border,
                  )),
              IconButton(
                  onPressed: () {
                    homeBloc.add(HomeProductCartButtonClickedEvent(
                      clickedProduct: productDataModel
                    ));
                  },
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                  )),
            ],
          )
        ]),
      ]),
    );
  }
}
