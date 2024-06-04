part of app_theme;

class AppLightColors extends AppColorsTheme {
  const AppLightColors();

  // Accent
  @override
  Color get accent => AppColors.celestialAlien;

  // Background
  @override
  Color get background => AppColors.washMe;

  //Layers
  @override
  Color get layer1 => AppColors.white26;
  @override
  Color get layer2 => AppColors.alpineGoat;
  @override
  Color get layer3 => AppColors.celestialAlien05;
  @override
  Color get layer4 => AppColors.bleachedSilk;

  // Text
  @override
  Color get primary => AppColors.nobleBlack;
  @override
  Color get placeholder => AppColors.silver;

  // System
  @override
  Color get error => AppColors.bloodDonor;

  // Icon
  @override
  Color get primaryIcon => AppColors.nobleBlackIcon;
}
