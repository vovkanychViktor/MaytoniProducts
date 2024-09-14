import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maytoni_product_store/features/cart/ui/cart_page.dart';
import 'package:maytoni_product_store/features/home_page/cubit/home_page_cubit.dart';
import 'package:maytoni_product_store/features/home_page/ui/product_item.dart';
import 'package:maytoni_product_store/features/wishlist/ui/wishlist_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<HomePageCubit, HomePageState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: const Text(
              'Maytoni Store',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Wishlist(),
                    ),
                  );
                },
                icon: const Icon(Icons.favorite_border_outlined),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Cart(),
                    ),
                  );
                },
                icon: const Icon(Icons.shopping_bag_outlined),
                color: Colors.white,
              ),
            ],
            backgroundColor: Colors.brown,
          ),
          body: ListView.builder(
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              final product = state.products[index];
              final isInWishlist = state.wishList.contains(product);
              return ProductItem(
                maytoniDataModel: product,
                onAddToCartTapped: () {},
                onFavoriteTapped: () {
                  context
                      .read<HomePageCubit>()
                      .addToWishList(state.products[index]);
                },
                icon: isInWishlist
                    ? Icons.favorite
                    : Icons.favorite_border_outlined,
              );
            },
          ),
        ),
      );
}
