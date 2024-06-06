part of home;

class GetReposByQueryUseCase extends FutureUseCase<List<Repo>, String> {
  final HomeRepository _repository;

  const GetReposByQueryUseCase({
    required HomeRepository repository,
  }) : _repository = repository;

  @override
  Future<List<Repo>> execute(String query) async {
    return await _repository.getReposByQuery(query);
  }
}
