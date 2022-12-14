import 'package:flutter/material.dart';
import 'package:flutter_sales/model/cart_model.dart';
import 'package:flutter_sales/page/avis_page.dart';
import 'package:flutter_sales/page/product_check_page.dart';
import 'package:flutter_sales/model/product_model.dart';
import 'package:provider/provider.dart';
import 'page/cart_page.dart';
import 'page/list_product_page.dart';
import 'page/detail_product_page.dart';

import 'package:go_router/go_router.dart';

void main() {
  runApp(
      ChangeNotifierProvider<CartModel>(
        create: (_)=>CartModel([]),
          child: MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (_, state) => ListProductPage(),
        //builder: (_, state) => ProductCheckPage(),
        routes: [
          GoRoute(
            path: 'detail',
            builder: (_, state) =>  DetailProductPage(state.extra as Product),
          ),
          GoRoute(
            path: 'cart',
            builder: (_, state) =>  const CartPage(),
          ),
          GoRoute(
              path: 'detail/avis',
              builder: (_, state) => ListAvisPage(state.extra as Product),
          ),
        ]
      )
    ]
  );


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      //home: CartPage(),
    );
  }
}

