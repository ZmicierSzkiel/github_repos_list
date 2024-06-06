part of di;

final GetIt getIt = GetIt.instance;

abstract class SingleZoneDI {
  const SingleZoneDI();

  void setup();
}

abstract class MultiZoneDI {
  const MultiZoneDI();

  void setup({required Flavor flavor});
}