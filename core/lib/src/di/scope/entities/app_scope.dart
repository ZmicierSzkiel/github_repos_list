part of di;

class AppScope {
  final AppScopeType type;
  final VoidCallback onInit;
  final VoidCallback? onPushed;

  const AppScope({
    required this.type,
    required this.onInit,
    this.onPushed,
  });
}
