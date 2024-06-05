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
  Future<void> deleteQueryFromHistory() {
    // TODO: implement deleteQueryFromHistory
    throw UnimplementedError();
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
  Future<List<String>> getSearchHistory() {
    // TODO: implement getSearchHistory
    throw UnimplementedError();
  }

  @override
  Future<void> setFavoriteRepo(Repo repo) {
    // TODO: implement setFavoriteRepo
    throw UnimplementedError();
  }

  @override
  Future<void> setQueryToSearchHistory(String query) {
    // TODO: implement setQueryToSearchHistory
    throw UnimplementedError();
  }
}
