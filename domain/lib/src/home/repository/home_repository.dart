part of home;

abstract interface class HomeRepository {
  const HomeRepository();

  Future<void> deleteQueryFromHistory(String query);
  List<Repo> getFavoriteRepos();
  Future<List<Repo>> getReposByQuery(String query);
  List<String> getPreviousQueries(); 
  Future<void> setFavoriteRepo(Repo repo);
  Future<void> setQueryToPreviousQueries(String query);
}
