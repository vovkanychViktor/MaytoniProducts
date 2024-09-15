import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maytoni_product_store/data/maytoni_data.dart';
import 'package:maytoni_product_store/data/wishlist_items.dart';
import 'package:maytoni_product_store/features/home/models/maytoni_data_model.dart';
import 'package:maytoni_product_store/features/wishlist/ui/wishlist_page.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit()
      : super(const HomePageState(
          isLoading: false,
          products: [],
          wishList: [],
        )) {
    _init();
  }

  void _init() {
    emit(
      state.copyWith(
        products: MaytoniData.maytoniProducts
            .map(
              (e) => MaytoniDataModel(
                id: e['id'],
                name: e['name'],
                article: e['article'],
                colorTemperature: e['colorTemperature'],
                power: e['power'],
                protectionLevel: e['protectionLevel'],
                height: e['height'],
                width: e['width'],
                length: e['length'],
                price: e['price'],
                imageUrl: e['imageUrl'],
              ),
            )
            .toList(),
        wishList: wishlistItemsData,
      ),
    );
  }

  void addToWishList(final MaytoniDataModel liked) {
    final updatedWithList = List<MaytoniDataModel>.from(state.wishList);
    if (updatedWithList.any((item) => item.id == liked.id)) {
      updatedWithList.removeWhere((e) => e.id == liked.id);
    } else {
      updatedWithList.add(liked);
    }

    emit(state.copyWith(wishList: updatedWithList));
    wishlistItemsData = updatedWithList;
  }

  Future<void> moveToWishListPage(final BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Wishlist(),
      ),
    ).whenComplete(() => _init());
  }
}
