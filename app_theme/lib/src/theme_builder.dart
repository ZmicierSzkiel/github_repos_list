part of app_theme;

final ThemeData lightTheme = _buildThemeData(
  base: ThemeData.light().copyWith(
    extensions: <ThemeExtension<AppColorsTheme>>[
      const AppLightColors(),
    ],
  ),
);

ThemeData _buildThemeData({required ThemeData base}) {
  final AppColorsTheme colors = base.colors;

  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      secondary: colors.placeholder,
    ),
    scaffoldBackgroundColor: colors.background,
    shadowColor: colors.transparent,
    appBarTheme: _buildAppBarTheme(colors, base.brightness),
    elevatedButtonTheme: _buildElevatedButtonTheme(colors),
    inputDecorationTheme: _buildInputDecorationTheme(colors),
    textTheme: _buildTextTheme(colors.placeholder),
    primaryTextTheme: _buildTextTheme(colors.primary),
    progressIndicatorTheme: _buildProgressIndicatorTheme(colors),
    textButtonTheme: _buildTextButtonTheme(colors),
  );
}

AppBarTheme _buildAppBarTheme(
  AppColorsTheme colors,
  Brightness brightness,
) {
  return AppBarTheme(
    shadowColor: AppColors.transparent,
    color: colors.layer1,
    systemOverlayStyle: SystemUiOverlayHelper.lightThemeStyle,
  );
}

ElevatedButtonThemeData _buildElevatedButtonTheme(AppColorsTheme colors) {
  const double buttonSize = 42.0;
  const double buttonRadius = 6.0;

  return ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: WidgetStateProperty.all(AppTextTheme.sora16Normal),
      foregroundColor: WidgetStateProperty.resolveWith(
        (Set<WidgetState> states) {
          return states.contains(WidgetState.selected)
              ? colors.primary
              : colors.placeholder;
        },
      ),
      backgroundColor: WidgetStateProperty.resolveWith(
        (Set<WidgetState> states) {
          return states.contains(WidgetState.disabled)
              ? colors.placeholder
              : colors.primary;
        },
      ),
      shadowColor: WidgetStateProperty.all(colors.transparent),
      minimumSize: WidgetStateProperty.all(
        const Size.square(buttonSize),
      ),
      maximumSize: WidgetStateProperty.all(
        const Size.fromHeight(buttonSize),
      ),
      shape: WidgetStateProperty.all(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(buttonRadius),
          ),
        ),
      ),
    ),
  );
}

InputDecorationTheme _buildInputDecorationTheme(AppColorsTheme colors) {
  const BorderRadius borderRadius = BorderRadius.all(
    Radius.circular(8.0),
  );

  return InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(color: colors.primary),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(color: colors.error),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(color: colors.accent),
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(color: AppColors.transparent),
    ),
    focusColor: colors.layer3,
    filled: true,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 20.0,
      vertical: 16.0,
    ),
    labelStyle: AppTextTheme.sora14Normal.copyWith(
      color: colors.primary,
    ),
  );
}

TextTheme _buildTextTheme(Color textColor) {
  return TextTheme(
    bodyLarge: AppTextTheme.sora16Semibold.copyWith(color: textColor),
    // Text
    bodyMedium: AppTextTheme.sora16Normal.copyWith(color: textColor),
    titleLarge: AppTextTheme.sora16Semibold.copyWith(color: textColor),
    // TextField
    titleMedium: AppTextTheme.sora16Normal.copyWith(color: textColor),
  );
}

ProgressIndicatorThemeData _buildProgressIndicatorTheme(AppColorsTheme colors) {
  return ProgressIndicatorThemeData(
    color: colors.primaryIcon,
    circularTrackColor: colors.primaryIcon,
  );
}

TextButtonThemeData _buildTextButtonTheme(AppColorsTheme colors) {
  return TextButtonThemeData(
    style: ButtonStyle(
      textStyle: WidgetStateProperty.all(AppTextTheme.sora16Normal),
      foregroundColor: WidgetStateProperty.all(colors.transparent),
    ),
  );
}
