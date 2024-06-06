abstract class UseCase<T, P> {
  const UseCase();

  T execute(P params);
}

abstract class FutureUseCase<T, P> {
  const FutureUseCase();

  Future<T> execute(P params);
}

abstract class StreamUseCase<T, P> {
  const StreamUseCase();

  Stream<T> execute(P params);
}

class NoParams {
  const NoParams();
}