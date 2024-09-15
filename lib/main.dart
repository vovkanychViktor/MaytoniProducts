import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maytoni_product_store/features/home_page/cubit/home_page_cubit.dart';
import 'package:maytoni_product_store/features/home_page/ui/home_page.dart';
import 'package:maytoni_product_store/features/wishlist/bloc/wishlist_bloc.dart';

import 'features/cart/bloc/cart_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Maytoni Store',
        home: MultiBlocProvider(
          providers: [
            BlocProvider<HomePageCubit>(
              create: (context) => HomePageCubit(),
            ),
            BlocProvider<CartBloc>(
              create: (context) => CartBloc(),
            ),
            BlocProvider<WishlistBloc>(
              create: (context) => WishlistBloc(),
            ),
          ],
          child: const HomePage(),
        ),
      );
}
