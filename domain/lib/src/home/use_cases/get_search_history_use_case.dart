part of home;

class GetSearchHistoryUseCase extends FutureUseCase<List<String>, NoParams> {
  final HomeRepository _repository;

  const GetSearchHistoryUseCase({
    required HomeRepository repository,
  }) : _repository = repository;

  @override
  Future<List<String>> execute ([NoParams? params]) async {
    return await _repository.getSearchHistory();
  }
}
