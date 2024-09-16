import 'package:flutter/material.dart';
import 'package:maytoni_product_store/features/cart/bloc/cart_bloc.dart';

import 'package:maytoni_product_store/data/models/maytoni_data_model.dart';

class CartTileWidget extends StatelessWidget {
  final MaytoniDataModel maytoniDataModel;
  final CartBloc cartBloc;
  const CartTileWidget(
      {super.key, required this.maytoniDataModel, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.brown.shade300),
          borderRadius: BorderRadius.circular(12)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Container(
              height: 95,
              width: 95,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(maytoniDataModel.imageUrl),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  maytoniDataModel.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  maytoniDataModel.article,
                  style: const TextStyle(fontSize: 12, color: Colors.brown),
                ),
                Text('\$' + maytoniDataModel.price.toString())
              ],
            ),
          ],
        ),
        const SizedBox(height: 5),
        Divider(
          height: 10,
          color: Colors.brown.shade100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              icon: const Icon(Icons.remove_circle_outline),
              color: Colors.black,
            ),
          ],
        )
      ]),
    );
  }
}
