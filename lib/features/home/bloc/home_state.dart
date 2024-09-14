part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<MaytoniDataModel> products;
  final List<MaytoniDataModel> wishlistItems;

  HomeLoadedSuccessState({required this.products, required this.wishlistItems});

  // Method to update the wishlist when an item is added or removed
  HomeLoadedSuccessState copyWith({
    List<MaytoniDataModel>? products,
    List<MaytoniDataModel>? wishlistItems,
  }) {
    return HomeLoadedSuccessState(
      products: products ?? this.products,
      wishlistItems: wishlistItems ?? this.wishlistItems,
    );
  }
}

class HomeErrorState extends HomeState {}

// Action states for navigating to different pages
class HomeNavigateToWishlistPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}

// Action states for feedback on cart or wishlist actions
class HomeProductItemCartAddedState extends HomeActionState {}

class HomeProductItemWishlistAddedState extends HomeActionState {
  final List<MaytoniDataModel> updatedWishlistItems;

  HomeProductItemWishlistAddedState({required this.updatedWishlistItems});
}
