part of 'home_page_cubit.dart';

// States
class HomePageState extends Equatable {
  const HomePageState({
    required this.isLoading,
    required this.products,
    required this.wishList,
  });

  final bool isLoading;
  final List<MaytoniDataModel> products;
  final List<MaytoniDataModel> wishList;

  HomePageState copyWith({
    bool? isLoading,
    List<MaytoniDataModel>? products,
    List<MaytoniDataModel>? wishList,
  }) =>
      HomePageState(
        isLoading: isLoading ?? this.isLoading,
        products: products ?? this.products,
        wishList: wishList ?? this.wishList,
      );

  @override
  List<Object> get props => [
        isLoading,
        products,
        wishList,
      ];
}
