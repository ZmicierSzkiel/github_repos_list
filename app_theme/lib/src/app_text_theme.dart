part of app_theme;

class AppTextTheme {
  static const String _packageName = kPackageName;
  static const String _soraFamily = 'Sora';

  static const TextStyle sora14Normal = TextStyle(
    fontSize: 14.0,
    height: 1.4,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontFamily: _soraFamily,
    package: _packageName,
  );

  static const TextStyle sora16Normal = TextStyle(
    fontSize: 16.0,
    height: 1.2,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontFamily: _soraFamily,
    package: _packageName,
  );

  static const TextStyle sora16Semibold = TextStyle(
    fontSize: 16.0,
    height: 1.2,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontFamily: _soraFamily,
    package: _packageName,
  );
}
