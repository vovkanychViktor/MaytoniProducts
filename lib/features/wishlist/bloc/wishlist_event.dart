part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class WishlistRemoveFromWishlistEvent extends WishlistEvent {
  final MaytoniDataModel maytoniDataModel;

  WishlistRemoveFromWishlistEvent({required this.maytoniDataModel});
}
