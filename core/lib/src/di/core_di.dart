part of di;

const CoreDI coreDI = CoreDI();

class CoreDI extends SingleZoneDI {
  const CoreDI();

  @override
  void setup() {
    getIt.registerSingleton<AppConfig>(AppConfig());
  }
}
