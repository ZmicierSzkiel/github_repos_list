part of dio;

const DioDI dioDI = DioDI();

class DioDI extends SingleZoneDI {
  const DioDI();

  @override
  void setup() {
    getIt.registerSingleton<Dio>(Dio());

    getIt.registerSingleton<DioProvider>(
      DioProviderImpl(
        appConfig: getIt.get<AppConfig>(),
        dio: getIt.get<Dio>(),
      )..setupDio(),
    );
  }
}
