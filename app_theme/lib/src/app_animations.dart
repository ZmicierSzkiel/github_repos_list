part of app_theme;

class AppAnimations {
  const AppAnimations();

  static const String packageName = kPackageName;

  static const String _basePath = kAnimationsPath;

  static const String _splashAnimationKey = '${_basePath}splash_animation.json';

  static const AppAnimation splashAnimation = AppAnimation(_splashAnimationKey);
}
