part of home;

class SetQueryToPreviousQueriesUseCase extends FutureUseCase<void, String> {
  final HomeRepository _repository;

  const SetQueryToPreviousQueriesUseCase({
    required HomeRepository repository,
  }) : _repository = repository;

  @override
  Future<void> execute(String query) async {
    await _repository.setQueryToPreviousQueries(query);
  }
}
