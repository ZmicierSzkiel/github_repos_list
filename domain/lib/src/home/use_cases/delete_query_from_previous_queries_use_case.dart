part of home;

class DeleteQueryFromPreviousQueriesUseCase extends FutureUseCase<void, String> {
  final HomeRepository _repository;

  const DeleteQueryFromPreviousQueriesUseCase({
    required HomeRepository repository,
  }) : _repository = repository;

  @override
  Future<void> execute (String query) async {
    await _repository.deleteQueryFromHistory(query);
  }
}
