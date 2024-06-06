import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

part 'favorites_event.dart';
part 'favorites_event_helper.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final AppRouter _appRouter;
  final DeleteRepoFromFavoritesUseCase _deleteRepoFromFavoritesUseCase;
  final GetFavoriteReposListUseCase _getFavoriteReposListUseCase;

  FavoritesBloc({
    required AppRouter appRouter,
    required DeleteRepoFromFavoritesUseCase deleteRepoFromFavoritesUseCase,
    required GetFavoriteReposListUseCase getFavoriteReposListUseCase,
  })  : _appRouter = appRouter,
        _deleteRepoFromFavoritesUseCase = deleteRepoFromFavoritesUseCase,
        _getFavoriteReposListUseCase = getFavoriteReposListUseCase,
        super(const FavoritesState()) {
    on<GetFavoriteReposList>(_onGetFavoriteReposList);
    on<DeleteRepoFromFavorites>(_onDeleteRepoFromFavorites);
    on<PopRoute>(_onPopRoute);

    add(GetFavoriteReposList());
  }

  void _onGetFavoriteReposList(
    GetFavoriteReposList event,
    Emitter<FavoritesState> emit,
  ) {
    emit(
      state.copyWith(loadingStatus: LoadingStatus.loading),
    );

    final List<Repo> favoriteRepos = _getFavoriteReposListUseCase.execute();

    emit(
      state.copyWith(
        favoriteRepos: favoriteRepos,
        loadingStatus: LoadingStatus.success,
      ),
    );
  }

  Future<void> _onDeleteRepoFromFavorites(
    DeleteRepoFromFavorites event,
    Emitter<FavoritesState> emit,
  ) async {
    final Repo repo = event.repo;

    await _deleteRepoFromFavoritesUseCase.execute(repo);
    final List<Repo> updatedRepos = _getFavoriteReposListUseCase.execute();

    emit(
      state.copyWith(favoriteRepos: updatedRepos),
    );
  }

  void _onPopRoute(
    PopRoute event,
    Emitter<FavoritesState> emit,
  ) {
    _appRouter.pop();
  }
}
