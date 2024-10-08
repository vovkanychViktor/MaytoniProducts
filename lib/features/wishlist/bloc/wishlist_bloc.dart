import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maytoni_product_store/data/source/wishlist_items.dart';
import 'package:maytoni_product_store/data/models/maytoni_data_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistEvent>((event, emit) {});
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemoveFromWishlistEvent>(wishlistRemoveFromWishlistEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(wishlistItems: wishlistItemsData));
  }

  FutureOr<void> wishlistRemoveFromWishlistEvent(
      WishlistRemoveFromWishlistEvent event, Emitter<WishlistState> emit) {
    wishlistItemsData.remove(event.maytoniDataModel);
    emit(WishlistSuccessState(wishlistItems: wishlistItemsData));
  }
}
