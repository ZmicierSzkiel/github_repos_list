part of favorites;

class GetFavoriteReposListUseCase extends UseCase<List<Repo>, NoParams> {
  final FavoritesRepository _repository;

  const GetFavoriteReposListUseCase({
    required FavoritesRepository repository,
  }) : _repository = repository;

  @override
  List<Repo> execute([NoParams? params]) {
    return _repository.getFavoriteReposList();
  }
}
