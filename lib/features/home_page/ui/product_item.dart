import 'package:flutter/material.dart';
import 'package:maytoni_product_store/data/models/maytoni_data_model.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.maytoniDataModel,
    required this.icon,
    required this.onAddToCartTapped,
    required this.onFavoriteTapped,
  });

  final MaytoniDataModel maytoniDataModel;
  final IconData icon;
  final VoidCallback onFavoriteTapped;
  final VoidCallback onAddToCartTapped;

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
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
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            Text(
              maytoniDataModel.article,
            ),
            Row(
              children: [
                Text(
                  maytoniDataModel.height.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Icon(Icons.height),
                const SizedBox(width: 10),
                Text(
                  maytoniDataModel.width.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Icon(Icons.height),
                const SizedBox(width: 10),
                Text(
                  maytoniDataModel.length.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Icon(Icons.height),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${maytoniDataModel.price}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: onFavoriteTapped,
                      icon: Icon(icon),
                      color: Colors.black,
                    ),
                    IconButton(
                      onPressed: onAddToCartTapped,
                      icon: const Icon(Icons.shopping_bag_outlined),
                      color: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
}
