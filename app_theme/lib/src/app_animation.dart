part of app_theme;

@immutable
class AppAnimation {
  static const double _defaultAnimationSize = 150.0;

  final String animationKey;

  const AppAnimation(this.animationKey);

  Widget call({
    double? width = _defaultAnimationSize,
    double? height = _defaultAnimationSize,
    BoxFit? fit,
  }) {
    return Lottie.asset(
      animationKey,
      package: AppAnimations.packageName,
      width: width ?? _defaultAnimationSize,
      height: height ?? _defaultAnimationSize,
      fit: fit ?? BoxFit.contain,
    );
  }
}
