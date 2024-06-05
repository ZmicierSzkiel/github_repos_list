part of favorites;

abstract interface class FavoritesRepository {
  const FavoritesRepository();

  List<Repo> getFavoriteReposList();
  Future<void> deleteRepoFromFavorites(Repo repo);
}