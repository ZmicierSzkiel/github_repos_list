part of app_theme;

@immutable
class AppIcon {
  static const String _svgFileRegex = r'.svg$';
  static const double _defaultIconSize = 24.0;

  final String iconKey;

  bool get isSVG => iconKey.contains(RegExp(_svgFileRegex));

  const AppIcon(this.iconKey);

  Widget call({
    Color? color,
    double? height = _defaultIconSize,
    double? width = _defaultIconSize,
    BoxFit? fit,
  }) {
    assert(
      isSVG,
      'Implemented only for svg',
    );

    return SvgPicture.asset(
      iconKey,
      package: AppIcons.packageName,
      colorFilter: color != null
          ? ColorFilter.mode(
              color,
              BlendMode.srcIn,
            )
          : null,
      height: height ?? _defaultIconSize,
      width: width ?? _defaultIconSize,
      fit: fit ?? BoxFit.contain,
    );
  }
}
