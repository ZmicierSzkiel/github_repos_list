import '../app_router/app_router.dart';

extension AuthNavigation on AppRouter {
  Future<void> goToMainZone() async {
    return replaceAll(
      <HomeRoute>[const HomeRoute()],
    );
  }
}
