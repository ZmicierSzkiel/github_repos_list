import 'package:core/core.dart';

import '../app_router/app_router.dart';

const NavigationDI navigationDI = NavigationDI();

class NavigationDI extends SingleZoneDI {
  const NavigationDI();

  @override
  void setup() {
    getIt.registerSingleton<AppRouter>(
      AppRouter(),
    );
  }
}
