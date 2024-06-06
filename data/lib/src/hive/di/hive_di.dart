part of hive;

const HiveDI hiveDI = HiveDI();

class HiveDI extends SingleZoneDI {
  const HiveDI();

  @override
  void setup() {
    getIt.registerSingletonAsync<HiveProvider>(
      () async {
        final HiveProvider hiveProvider = HiveProvider();

        await hiveProvider.initHive();

        return hiveProvider;
      },
    );
  }
}
