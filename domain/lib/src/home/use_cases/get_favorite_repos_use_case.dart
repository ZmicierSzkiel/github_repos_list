part of home;

class GetFavoriteReposUseCase extends UseCase<List<Repo>, NoParams> {
  final HomeRepository _repository;

  const GetFavoriteReposUseCase({
    required HomeRepository repository,
  }) : _repository = repository;

  @override
  List<Repo> execute([NoParams? params]) {
    return _repository.getFavoriteRepos();
  }
}
