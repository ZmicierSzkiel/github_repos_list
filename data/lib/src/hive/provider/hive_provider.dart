part of hive;

class HiveProvider {
  const HiveProvider();

  Future<void> initHive() async {
    await Hive.initFlutter();

    Hive.registerAdapter(RepoAdapter());
  }
}
