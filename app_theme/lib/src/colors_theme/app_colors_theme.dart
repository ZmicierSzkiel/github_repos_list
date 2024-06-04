part of app_theme;

@immutable
abstract interface class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  const AppColorsTheme();

  Color get transparent => AppColors.transparent;

  // Accent
  Color get accent;

  // Background
  Color get background;

  // Layers
  Color get layer1;
  Color get layer2;
  Color get layer3;
  Color get layer4;

  // Text
  Color get primary;
  Color get placeholder;

  // System
  Color get error;

  // Shadow
  Color get shadow;

  // Icon
  Color get primaryIcon;

  @override
  ThemeExtension<AppColorsTheme> copyWith() {
    return this;
  }

  @override
  ThemeExtension<AppColorsTheme> lerp(
    covariant ThemeExtension<AppColorsTheme>? other,
    double t,
  ) {
    return this;
  }
}
