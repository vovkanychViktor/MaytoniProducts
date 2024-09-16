import 'package:flutter/material.dart';
import 'package:maytoni_product_store/data/models/maytoni_data_model.dart';
import 'package:maytoni_product_store/features/wishlist/bloc/wishlist_bloc.dart';

class WishlistTileWidget extends StatelessWidget {
  const WishlistTileWidget({
    super.key,
    required this.maytoniDataModel,
    required this.wishlistBloc,
  });

  final MaytoniDataModel maytoniDataModel;
  final WishlistBloc wishlistBloc;

  @override
  Widget build(BuildContext context) => Container(
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
                icon: const Icon(Icons.shopping_bag_outlined),
                color: Colors.black,
              ),
              IconButton(
                onPressed: () {
                  wishlistBloc.add(WishlistRemoveFromWishlistEvent(
                      maytoniDataModel: maytoniDataModel));
                },
                icon: const Icon(Icons.favorite),
                color: Colors.black,
              ),
            ],
          )
        ]),
      );
}
