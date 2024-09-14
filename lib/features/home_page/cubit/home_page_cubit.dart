import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maytoni_product_store/data/maytoni_data.dart';
import 'package:maytoni_product_store/data/wishlist_items.dart';
import 'package:maytoni_product_store/features/home/models/maytoni_data_model.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit()
      : super(const HomePageState(
          isLoading: false,
          products: [],
          wishList: [],
        )) {
    // Call your initialization function here
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
    final updatedWithList = List<MaytoniDataModel>.from(state.wishList)
      ..add(liked);
    emit(state.copyWith(wishList: updatedWithList));
  }
}
