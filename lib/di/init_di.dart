import 'package:core/core.dart';
import 'package:navigation/navigation.dart';

import 'push_main_scope.dart';

void initDI() {
  final AppScope mainScope = AppScope(
    type: AppScopeType.main,
    onInit: pushMainScope,
    onPushed: () {
      getIt.get<AppRouter>().goToMainZone();
    },
  );

  final AppScopes appScopes = AppScopes(
    scopes: <AppScope>[mainScope],
  );

  appScopes.initDI();
  appScopes.pushMain();
}
