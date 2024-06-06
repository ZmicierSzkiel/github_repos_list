part of hive;

class HiveProvider {
  const HiveProvider();

  Future<void> initHive() async {
    await Hive.initFlutter();

    Hive.registerAdapter(RepoAdapter());

    await Hive.openBox<Repo>(HiveKeys.favoriteRepos);
    await Hive.openBox<List<String>>(HiveKeys.previousQueries);
  }

  Future<void> setQueryToPreviousQueries(String query) async {
    final Box<List<String>> previousQueriesBox = Hive.box<List<String>>(
      HiveKeys.previousQueries,
    );

    List<String> previousQueries = previousQueriesBox.get(
      HiveKeys.previousQueries,
      defaultValue: [],
    )!;

    if (!previousQueries.contains(query)) {
      previousQueries.add(query);
      await previousQueriesBox.put(HiveKeys.previousQueries, previousQueries);
    }
  }

  List<String> getPreviousQueries() {
    final Box<List<String>> previousQueriesBox = Hive.box<List<String>>(
      HiveKeys.previousQueries,
    );

    final List<String> previousQueries = previousQueriesBox.get(
      HiveKeys.previousQueries,
      defaultValue: [],
    )!;
    return previousQueries.reversed.toList();
  }

  Future<void> deleteQueryFromPreviousQueries(String query) async {
    final Box<List<String>> previousQueriesBox = Hive.box<List<String>>(
      HiveKeys.previousQueries,
    );

    List<String> previousQueries = previousQueriesBox.get(
      HiveKeys.previousQueries,
      defaultValue: [],
    )!;

    previousQueries.remove(query);
    await previousQueriesBox.put(HiveKeys.previousQueries, previousQueries);
  }

  Future<void> setFavoriteRepo(Repo repo) async {
    final Box<Repo> favoriteReposBox = Hive.box<Repo>(HiveKeys.favoriteRepos);

    await favoriteReposBox.put(repo.id, repo);
  }

  List<Repo> getFavoriteRepos() {
    final Box<Repo> favoriteReposBox = Hive.box<Repo>(HiveKeys.favoriteRepos);

    return favoriteReposBox.values.toList();
  }

  Future<void> deleteRepoFromFavorites(Repo repo) async {
    final Box<Repo> favoriteReposBox = Hive.box<Repo>(HiveKeys.favoriteRepos);

    await favoriteReposBox.delete(repo.id);
  }
}
