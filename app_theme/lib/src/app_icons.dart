part of app_theme;

class AppIcons {
  const AppIcons();

  static const String packageName = kPackageName;

  static const String _basePath = kIconsPath;

  static const String _arrowIconKey = '${_basePath}arrow_icon.svg';
  static const String _banIconKey = '${_basePath}ban_icon.svg';
  static const String _closeIconKey = '${_basePath}close_icon.svg';
  static const String _deleteIconKey = '${_basePath}delete_icon.svg';

  // Favorite
  static const String _favoriteButtonIconKey =
      '${_basePath}favorite_button_icon.svg';
  static const String _favoriteSelectedIconKey =
      '${_basePath}favorite_selected_icon.svg';
  static const String _favoriteUnselectedIconKey =
      '${_basePath}favorite_unselected_icon.svg';

  // Search
  static const String _noResultIconKey = '${_basePath}no_result_icon.svg';
  static const String _searchIconKey = '${_basePath}search_icon.svg';

  static const AppIcon arrowIcon = AppIcon(_arrowIconKey);
  static const AppIcon banIcon = AppIcon(_banIconKey);
  static const AppIcon closeIcon = AppIcon(_closeIconKey);
  static const AppIcon deleteIcon = AppIcon(_deleteIconKey);

  // Favorite
  static const AppIcon favoriteButtonIcon = AppIcon(_favoriteButtonIconKey);
  static const AppIcon favoriteSelectedIcon = AppIcon(_favoriteSelectedIconKey);
  static const AppIcon favoriteUnselectedIcon =
      AppIcon(_favoriteUnselectedIconKey);

  // Search
  static const AppIcon noResultIcon = AppIcon(_noResultIconKey);
  static const AppIcon searchIcon = AppIcon(_searchIconKey);
}
