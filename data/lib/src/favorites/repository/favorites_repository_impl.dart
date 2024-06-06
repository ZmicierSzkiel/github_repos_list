part of favorites;

class FavoritesRepositoryImpl implements FavoritesRepository {
  final HiveProvider _hiveProvider;

  const FavoritesRepositoryImpl({
    required HiveProvider hiveProvider,
  }) : _hiveProvider = hiveProvider;

  @override
  Future<void> deleteRepoFromFavorites(Repo repo) async {
    await _hiveProvider.deleteRepoFromFavorites(repo);
  }

  @override
  List<Repo> getFavoriteReposList() {
    final List<Repo> favoriteRepos = _hiveProvider.getFavoriteRepos();

    return favoriteRepos;
  }
}
