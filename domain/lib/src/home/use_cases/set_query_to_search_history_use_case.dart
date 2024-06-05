part of home;

class SetQueryToSearchHistoryUseCase extends FutureUseCase<void, String> {
  final HomeRepository _repository;

  const SetQueryToSearchHistoryUseCase({
    required HomeRepository repository,
  }) : _repository = repository;

  @override
  Future<void> execute(String query) async {
    await _repository.setQueryToSearchHistory(query);
  }
}
