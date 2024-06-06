import 'package:flutter/material.dart';

import 'package:core/core.dart';
import 'package:navigation/navigation.dart';

import '../bloc/splash_bloc.dart';
import 'splash_content.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SplashBloc(
        appRouter: getIt.get<AppRouter>(),
      ),
      child: const SplashContent(),
    );
  }
}
