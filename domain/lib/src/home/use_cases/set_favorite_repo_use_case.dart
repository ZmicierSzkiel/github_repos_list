part of home;

class SetFavoriteRepoUseCase extends FutureUseCase<void, Repo> {
  final HomeRepository _repository;

  const SetFavoriteRepoUseCase({
    required HomeRepository repository,
  }) : _repository = repository;

  @override
  Future<void> execute(Repo repo) async {
    await _repository.setFavoriteRepo(repo);
  }
}
