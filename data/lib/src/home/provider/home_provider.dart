part of home;

abstract interface class HomeProvider {
  const HomeProvider();

  Future<List<Repo>> getReposByQuery(String query);
}