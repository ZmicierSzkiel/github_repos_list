import 'package:flutter/material.dart';

import 'package:app_theme/app_theme.dart';
import 'package:core/core.dart';

import '../bloc/splash_bloc.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.theme.colors;

    return BlocBuilder<SplashBloc, SplashState>(
      builder: (BuildContext context, SplashState state) {
        return Scaffold(
          backgroundColor: colors.accent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Search app',
                  style: AppTextTheme.sora16Semibold.copyWith(
                    color: colors.layer1,
                  ),
                ),
                AppAnimations.splashAnimation.call(),
              ],
            ),
          ),
        );
      },
    );
  }
}
