part of home;

class HomeRepositoryImpl implements HomeRepository {
  final HiveProvider _hiveProvider;
  final HomeProvider _homeProvider;

  const HomeRepositoryImpl({
    required HiveProvider hiveProvider,
    required HomeProvider homeProvider,
  })  : _hiveProvider = hiveProvider,
        _homeProvider = homeProvider;

  @override
  Future<void> deleteQueryFromHistory(String query) async {
    await _hiveProvider.deleteQueryFromPreviousQueries(query);
  }

  @override
  Future<void> deleteRepoFromFavorite() {
    // TODO: implement deleteRepoFromFavorite
    throw UnimplementedError();
  }

  @override
  List<Repo> getFavoriteRepos() {
    final List<Repo> favoriteRepos = _hiveProvider.getFavoriteRepos();

    return favoriteRepos;
  }

  @override
  Future<List<Repo>> getReposByQuery(String query) async {
    final List<Repo> repos = await _homeProvider.getReposByQuery(query);

    return repos;
  }

  @override
  List<String> getPreviousQueries() {
    final List<String> previousQueries = _hiveProvider.getPreviousQueries();

    return previousQueries;
  }

  @override
  Future<void> setFavoriteRepo(Repo repo) async {
    await _hiveProvider.setFavoriteRepo(repo);
  }

  @override
  Future<void> setQueryToPreviousQueries(String query) async {
    await _hiveProvider.setQueryToPreviousQueries(query);
  }
}
