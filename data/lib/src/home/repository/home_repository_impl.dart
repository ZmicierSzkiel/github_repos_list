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
  Future<List<Repo>> getFavoriteRepos() {
    // TODO: implement getFavoriteRepos
    throw UnimplementedError();
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
  Future<void> setFavoriteRepo(Repo repo) {
    // TODO: implement setFavoriteRepo
    throw UnimplementedError();
  }

  @override
  Future<void> setQueryToPreviousQueries(String query) async {
    await _hiveProvider.setQueryToPreviousQueries(query);
  }
}
