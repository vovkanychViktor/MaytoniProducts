import 'package:flutter/material.dart';
import 'package:maytoni_product_store/features/cart/bloc/cart_bloc.dart';

import 'package:maytoni_product_store/features/home/models/maytoni_data_model.dart';

class CartTileWidget extends StatelessWidget {
  final MaytoniDataModel maytoniDataModel;
  final CartBloc cartBloc;
  const CartTileWidget(
      {super.key, required this.maytoniDataModel, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 350,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(maytoniDataModel.imageUrl),
              ),
            ),
          ),
          Text(
            maytoniDataModel.name,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          Text(
            maytoniDataModel.article,
          ),
          Row(
            children: [
              Text(
                maytoniDataModel.height.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Icon(Icons.height),
              SizedBox(width: 10),
              Text(
                maytoniDataModel.width.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Icon(Icons.height),
              SizedBox(width: 10),
              Text(
                maytoniDataModel.length.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Icon(Icons.height),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$' + maytoniDataModel.price.toString(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // homeBloc.add(HomeProductWishlistButtonClickedEvent(
                      //     clickedProduct: maytoniDataModel));
                    },
                    icon: const Icon(Icons.favorite_border_outlined),
                    color: Colors.black,
                  ),
                  IconButton(
                    onPressed: () {
                      cartBloc.add(CartRemoveFromCartEvent(
                          maytoniDataModel: maytoniDataModel));
                    },
                    icon: const Icon(Icons.shopping_bag),
                    color: Colors.black,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
