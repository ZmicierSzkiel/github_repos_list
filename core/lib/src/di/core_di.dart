part of di;

const CoreDI coreDI = CoreDI();

class CoreDI extends MultiZoneDI {
  const CoreDI();

  @override
  void setup({required Flavor flavor}) {
    getIt.registerSingleton<AppConfig>(
      AppConfig.fromFlavor(flavor: flavor),
    );
  }
}
