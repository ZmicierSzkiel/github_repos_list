part of home;

class DeleteRepoFromFavoriteUseCase extends FutureUseCase<void, NoParams> {
  final HomeRepository _repository;

  const DeleteRepoFromFavoriteUseCase({
    required HomeRepository repository,
  }) : _repository = repository;

  @override
  Future<void> execute([NoParams? params]) async {
    await _repository.deleteRepoFromFavorite();
  }
}
