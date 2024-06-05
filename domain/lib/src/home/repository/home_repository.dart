part of home;

abstract interface class HomeRepository {
  const HomeRepository();

  Future<void> deleteQueryFromHistory();
  Future<void> deleteRepoFromFavorite();
  Future<List<Repo>> getFavoriteRepos();
  Future<List<Repo>> getReposByQuery(String query);
  Future<List<String>> getSearchHistory(); 
  Future<void> setFavoriteRepo(Repo repo);
  Future<void> setQueryToSearchHistory(String query);
}
