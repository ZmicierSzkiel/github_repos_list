import 'package:flutter/material.dart';

import 'package:app_theme/app_theme.dart';
import 'package:core/core.dart';
import 'package:navigation/navigation.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = getIt.get<AppRouter>();

    return MaterialApp.router(
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
