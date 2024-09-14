import 'package:flutter/material.dart';
import 'package:maytoni_product_store/data/wishlist_items.dart';
import 'package:maytoni_product_store/features/home/ui/product_tile_widget.dart';
import 'package:maytoni_product_store/features/wishlist/ui/wishlist_page.dart';

import '../../cart/ui/cart_page.dart';
import '../bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Cart(),
            ),
          );
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Wishlist(),
            ),
          );
        } else if (state is HomeProductItemWishlistAddedState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Added to Wishlist')));
        } else if (state is HomeProductItemCartAddedState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Added to Cart')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Maytoni Store',
                  style: TextStyle(color: Colors.white),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeWishlistButtonnavigateEvent());
                    },
                    icon: const Icon(Icons.favorite_border_outlined),
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeCartButtonnavigateEvent());
                    },
                    icon: const Icon(Icons.shopping_bag_outlined),
                    color: Colors.white,
                  ),
                ],
                backgroundColor: Colors.brown,
              ),
              body: ListView.builder(
                itemCount: successState.products.length,
                itemBuilder: (context, index) {
                  return ProductTileWidget(
                    homeBloc: homeBloc,
                    maytoniDataModel: successState.products[index],
                    icon: wishlistItems.contains(successState.products[index])
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                  );
                },
              ),
            );

          case HomeErrorState:
            return const Scaffold(
                body: Center(
              child: Text('ERROR'),
            ));
          default:
            return const SizedBox();
        }
      },
    );
  }
}
