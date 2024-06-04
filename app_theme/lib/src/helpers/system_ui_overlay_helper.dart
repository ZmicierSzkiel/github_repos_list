part of app_theme;

class SystemUiOverlayHelper {
  static const SystemUiOverlayStyle lightThemeStyle = SystemUiOverlayStyle(
    statusBarColor: AppColors.transparent,
    systemStatusBarContrastEnforced: false,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
  );

  static void setLightThemeStyle() {
    SystemChrome.setSystemUIOverlayStyle(lightThemeStyle);
  }
}
