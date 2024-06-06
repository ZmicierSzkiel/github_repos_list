part of favorites;

const FavoritesDI favoritesDI = FavoritesDI();

class FavoritesDI extends SingleZoneDI {
  const FavoritesDI();

  @override
  void setup() {
    getIt.registerSingletonWithDependencies<FavoritesRepository>(
      () => FavoritesRepositoryImpl(
        hiveProvider: getIt.get<HiveProvider>(),
      ),
      dependsOn: <Type>[HiveProvider],
    );

    getIt.registerFactory<DeleteRepoFromFavoritesUseCase>(
      () => DeleteRepoFromFavoritesUseCase(
        repository: getIt.get<FavoritesRepository>(),
      ),
    );

     getIt.registerFactory<GetFavoriteReposListUseCase>(
      () => GetFavoriteReposListUseCase(
        repository: getIt.get<FavoritesRepository>(),
      ),
    );
  }
}
