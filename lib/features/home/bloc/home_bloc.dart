import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:maytoni_product_store/data/cart_items.dart';
import 'package:maytoni_product_store/data/maytoni_data.dart';
import 'package:maytoni_product_store/data/wishlist_items.dart';
import 'package:maytoni_product_store/features/home/models/maytoni_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishlistButtonnavigateEvent>(homeWishlistButtonnavigateEvent);
    on<HomeCartButtonnavigateEvent>(homeCartButtonnavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());

    await Future.delayed(const Duration(seconds: 3));

    emit(
      HomeLoadedSuccessState(
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
        wishlistItems: [], // Initialize wishlistItems as an empty list
      ),
    );
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Clicked on Wishlist Product');

    if (state is HomeLoadedSuccessState) {
      final currentState = state as HomeLoadedSuccessState;
      List<MaytoniDataModel> updatedWishlist =
          List.from(currentState.wishlistItems);

      // Add or remove the product from the wishlist
      if (!updatedWishlist.contains(event.clickedProduct)) {
        updatedWishlist.add(event.clickedProduct);
      } else {
        updatedWishlist.remove(event.clickedProduct);
      }

      // Emit new state with updated wishlist
      emit(currentState.copyWith(wishlistItems: updatedWishlist));
      wishlistItemsData.addAll(updatedWishlist);

      // Emit the action state for feedback (Snackbar or UI updates)
      emit(HomeProductItemWishlistAddedState(
          updatedWishlistItems: updatedWishlist));
    }
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Clicked on Cart Product');

    // Add product to cartItems
    cartItems.add(event.clickedProduct);

    // Emit cart added state
    emit(HomeProductItemCartAddedState());
  }

  FutureOr<void> homeWishlistButtonnavigateEvent(
      HomeWishlistButtonnavigateEvent event, Emitter<HomeState> emit) {
    print('Clicked on Wishlist Nav Page');

    // Navigate to Wishlist page
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonnavigateEvent(
      HomeCartButtonnavigateEvent event, Emitter<HomeState> emit) {
    print('Clicked on Cart Nav Page');

    // Navigate to Cart page
    emit(HomeNavigateToCartPageActionState());
  }
}
