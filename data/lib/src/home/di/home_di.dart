part of home;

const HomeDI homeDI = HomeDI();

class HomeDI extends SingleZoneDI {
  const HomeDI();

  @override
  void setup() {
    getIt.registerSingleton<HomeProvider>(
      HomeProviderImpl(
        appConfig: getIt.get<AppConfig>(),
        dioProvider: getIt.get<DioProvider>(),
      ),
    );

    getIt.registerSingletonWithDependencies<HomeRepository>(
      () => HomeRepositoryImpl(
        hiveProvider: getIt.get<HiveProvider>(),
        homeProvider: getIt.get<HomeProvider>(),
      ),
      dependsOn: <Type>[HiveProvider],
    );

    getIt.registerFactory<DeleteQueryFromPreviousQueriesUseCase>(
      () => DeleteQueryFromPreviousQueriesUseCase(
        repository: getIt.get<HomeRepository>(),
      ),
    );
    getIt.registerFactory<DeleteRepoFromFavoriteUseCase>(
      () => DeleteRepoFromFavoriteUseCase(
        repository: getIt.get<HomeRepository>(),
      ),
    );
    getIt.registerFactory<GetFavoriteReposUseCase>(
      () => GetFavoriteReposUseCase(
        repository: getIt.get<HomeRepository>(),
      ),
    );
    getIt.registerFactory<GetReposByQueryUseCase>(
      () => GetReposByQueryUseCase(
        repository: getIt.get<HomeRepository>(),
      ),
    );
    getIt.registerFactory<GetPreviousQueriesUseCase>(
      () => GetPreviousQueriesUseCase(
        repository: getIt.get<HomeRepository>(),
      ),
    );
    getIt.registerFactory<SetFavoriteRepoUseCase>(
      () => SetFavoriteRepoUseCase(
        repository: getIt.get<HomeRepository>(),
      ),
    );
    getIt.registerFactory<SetQueryToPreviousQueriesUseCase>(
      () => SetQueryToPreviousQueriesUseCase(
        repository: getIt.get<HomeRepository>(),
      ),
    );
  }
}
