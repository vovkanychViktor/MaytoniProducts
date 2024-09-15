import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maytoni_product_store/data/source/wishlist_items.dart';
import 'package:maytoni_product_store/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:maytoni_product_store/features/wishlist/ui/wishlist_tile_widget.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  final WishlistBloc wishlistBloc = WishlistBloc();
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop(wishlistItemsData);
            },
            child: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            'Wishlist Page',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.brown,
        ),
        body: BlocConsumer<WishlistBloc, WishlistState>(
          bloc: wishlistBloc,
          listener: (context, state) {},
          listenWhen: (previous, current) => current is WishlistActionState,
          buildWhen: (previous, current) => current is! WishlistActionState,
          builder: (context, state) {
            switch (state.runtimeType) {
              case WishlistSuccessState:
                final successState = state as WishlistSuccessState;
                return ListView.builder(
                  itemCount: successState.wishlistItems.length,
                  itemBuilder: (context, index) => WishlistTileWidget(
                    wishlistBloc: wishlistBloc,
                    maytoniDataModel: successState.wishlistItems[index],
                  ),
                );
              default:
            }
            return Container();
          },
        ),
      );
}
