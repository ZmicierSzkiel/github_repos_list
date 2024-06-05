part of home;

class GetFavoriteReposUseCase extends FutureUseCase<List<Repo>, NoParams> {
  final HomeRepository _repository;

  const GetFavoriteReposUseCase({
    required HomeRepository repository,
  }) : _repository = repository;

  @override
  Future<List<Repo>> execute ([NoParams? params])async {
    return await _repository.getFavoriteRepos();
  }
}
