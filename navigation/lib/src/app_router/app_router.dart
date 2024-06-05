import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

import 'package:favorites/favorites.dart';
import 'package:home/home.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: HomeScreen,
      initial: true,
    ),
    AutoRoute(page: FavoritesScreen),
  ],
)
class AppRouter extends _$AppRouter {}
