part of home;

class GetPreviousQueriesUseCase extends UseCase<List<String>, NoParams> {
  final HomeRepository _repository;

  const GetPreviousQueriesUseCase({
    required HomeRepository repository,
  }) : _repository = repository;

  @override
  List<String> execute([NoParams? params]) {
    return _repository.getPreviousQueries();
  }
}
