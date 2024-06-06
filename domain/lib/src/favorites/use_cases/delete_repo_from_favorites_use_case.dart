part of favorites;

class DeleteRepoFromFavoritesUseCase extends FutureUseCase<void, Repo> {
  final FavoritesRepository _repository;

  const DeleteRepoFromFavoritesUseCase({
    required FavoritesRepository repository,
  }) : _repository = repository;

  @override
  Future<void> execute(Repo repo) async {
    await _repository.deleteRepoFromFavorites(repo);
  }
}
