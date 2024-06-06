part of di;

class AppScopes {
  final List<AppScope> scopes;

  const AppScopes({
    required this.scopes,
  });

  static Future<void> get whenScopeReady => getIt.allReady();

  void initDI() {
    getIt.registerSingleton<AppScopes>(this);
  }

  void pushScope({
    required AppScopeType scope,
  }) {
    final AppScope? appScope = scopes.firstWhereOrNull(
      (AppScope appScope) => appScope.type == scope,
    );

    if (appScope == null) throw Exception('Scope not found');

    return _pushAppScope(scope: appScope);
  }

  void _pushAppScope({
    required AppScope scope,
  }) {
    getIt.pushNewScope(
      scopeName: scope.type.name,
      init: (_) => scope.onInit(),
    );

    whenScopeReady.then(
      (_) => scope.onPushed?.call(),
    );
  }

  void popScope() => getIt.popScope();
}
