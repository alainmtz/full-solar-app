
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'models/product.dart';
import 'screens/home_screen.dart';
import 'screens/add_product_screen.dart';
import 'screens/edit_product_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'add-product',
          builder: (BuildContext context, GoRouterState state) {
            return const AddProductScreen();
          },
        ),
        GoRoute(
          path: 'edit-product',
          builder: (BuildContext context, GoRouterState state) {
            final product = state.extra as Product;
            return EditProductScreen(product: product);
          },
        ),
      ],
    ),
  ],
);
