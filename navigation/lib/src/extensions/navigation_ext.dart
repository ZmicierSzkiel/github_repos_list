import '../app_router/app_router.dart';

extension Navigation on AppRouter {
  Future<void> setSplashScreen() async {
    return replaceAll(
      <SplashRoute>[const SplashRoute()],
    );
  }
}
