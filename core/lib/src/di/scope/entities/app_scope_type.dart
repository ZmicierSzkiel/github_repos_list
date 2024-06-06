part of di;

enum AppScopeType {
  main(AppScopesNames.mainScopeName);

  final String name;

  const AppScopeType(this.name);
}

class AppScopesNames {
  const AppScopesNames();

  static const String mainScopeName = 'main';
}
