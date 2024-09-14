import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maytoni_product_store/features/cart/ui/cart_page.dart';
import 'package:maytoni_product_store/features/wishlist/bloc/wishlist_bloc.dart';

import 'features/cart/bloc/cart_bloc.dart';
import 'features/home/bloc/home_bloc.dart';
import 'features/home/ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Maytoni Store',
      home: MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(),
          ),
          BlocProvider<CartBloc>(
            create: (context) => CartBloc(),
          ),
          BlocProvider<WishlistBloc>(
            create: (context) => WishlistBloc(),
          ),
        ],
        child: const Home(),
      ),
    );
  }
}
