import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

import 'package:favorites/favorites.dart';
import 'package:home/home.dart';
import 'package:splash/splash.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashScreen,
      initial: true,
    ),
    AutoRoute(page: HomeScreen),
    AutoRoute(page: FavoritesScreen),
  ],
)
class AppRouter extends _$AppRouter {}
