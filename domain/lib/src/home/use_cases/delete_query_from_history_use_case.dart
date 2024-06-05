part of home;

class DeleteQueryFromHistoryUseCase extends FutureUseCase<void, NoParams> {
  final HomeRepository _repository;

  const DeleteQueryFromHistoryUseCase({
    required HomeRepository repository,
  }) : _repository = repository;

  @override
  Future<void> execute ([NoParams? params]) async {
    await _repository.deleteQueryFromHistory();
  }
}
