import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

part 'home_event.dart';
part 'home_event_helper.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AppRouter _appRouter;
  final DeleteQueryFromPreviousQueriesUseCase
      _deleteQueryFromPreviousQueriesUseCase;
  final GetFavoriteReposUseCase _getFavoriteReposUseCase;
  final GetReposByQueryUseCase _getReposByQueryUseCase;
  final GetPreviousQueriesUseCase _getPreviousQueriesUseCase;
  final SetFavoriteRepoUseCase _setFavoriteRepoUseCase;
  final SetQueryToPreviousQueriesUseCase _setQueryToPreviousQueriesUseCase;

  HomeBloc({
    required AppRouter appRouter,
    required DeleteQueryFromPreviousQueriesUseCase
        deleteQueryFromPreviousQueriesUseCase,
    required GetFavoriteReposUseCase getFavoriteReposUseCase,
    required GetReposByQueryUseCase getReposByQueryUseCase,
    required GetPreviousQueriesUseCase getPreviousQueriesUseCase,
    required SetFavoriteRepoUseCase setFavoriteRepoUseCase,
    required SetQueryToPreviousQueriesUseCase setQueryToPreviousQueriesUseCase,
  })  : _appRouter = appRouter,
        _deleteQueryFromPreviousQueriesUseCase =
            deleteQueryFromPreviousQueriesUseCase,
        _getFavoriteReposUseCase = getFavoriteReposUseCase,
        _getReposByQueryUseCase = getReposByQueryUseCase,
        _getPreviousQueriesUseCase = getPreviousQueriesUseCase,
        _setFavoriteRepoUseCase = setFavoriteRepoUseCase,
        _setQueryToPreviousQueriesUseCase = setQueryToPreviousQueriesUseCase,
        super(const HomeState()) {
    on<GetReposByQuery>(_onGetReposByQuery);
    on<GetPreviousQueries>(_onGetPreviousQueries);
    on<GetFavoriteRepos>(_onGetFavoriteRepos);
    on<SetFavoriteRepo>(_onSetFavoriteRepo);
    on<ClearTextField>(_onClearTextField);
    on<DeleteQueryFromPreviousQueries>(_onDeleteQueryFromPreviousQueries);
    on<ToggleSearchHintText>(_onToggleSearchHintText);
    on<ToggleAppSearchTextFieldColor>(_onToggleAppSearchTextFieldColor);
    on<PushRoute>(_onPushRoute);

    add(GetPreviousQueries());
    add(GetFavoriteRepos());
  }

  Future<void> _onGetReposByQuery(
    GetReposByQuery event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(loadingStatus: LoadingStatus.loading),
    );

    final String query = event.query;

    await _setQueryToPreviousQueriesUseCase.execute(query);
    final List<Repo> repos = await _getReposByQueryUseCase.execute(query);
    final List<Repo> favoriteRepos = await _getFavoriteReposUseCase.execute();

    final List<Repo> updatedRepos = repos.map((Repo repo) {
      final isFavorite = favoriteRepos.any(
        (Repo favoriteRepo) => favoriteRepo.id == repo.id,
      );

      return repo.copyWith(isFavorite: isFavorite);
    }).toList();

    emit(
      state.copyWith(
        repos: updatedRepos,
        favoriteRepos: favoriteRepos,
        loadingStatus: LoadingStatus.success,
      ),
    );
  }

  void _onGetPreviousQueries(
    GetPreviousQueries event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(loadingStatus: LoadingStatus.loading),
    );
    final List<String> previousQueries = _getPreviousQueriesUseCase.execute();

    emit(
      state.copyWith(
        previousQueries: previousQueries,
        loadingStatus: LoadingStatus.success,
      ),
    );

    emit(
      state.copyWith(loadingStatus: LoadingStatus.idle),
    );
  }

  void _onGetFavoriteRepos(
    GetFavoriteRepos event,
    Emitter<HomeState> emit,
  ) {
    final List<Repo> favoriteRepos = _getFavoriteReposUseCase.execute();

    emit(
      state.copyWith(favoriteRepos: favoriteRepos),
    );
  }

  Future<void> _onSetFavoriteRepo(
    SetFavoriteRepo event,
    Emitter<HomeState> emit,
  ) async {
    final Repo repo = event.repo;
    final Repo favoriteRepo = Repo(
      id: repo.id,
      name: repo.name,
      isFavorite: true,
    );

    await _setFavoriteRepoUseCase.execute(favoriteRepo);
    final List<Repo> favoriteRepos = _getFavoriteReposUseCase.execute();

    emit(
      state.copyWith(favoriteRepos: favoriteRepos),
    );
  }

  void _onClearTextField(
    ClearTextField event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(loadingStatus: LoadingStatus.loading),
    );
    final List<String> previousQueries = _getPreviousQueriesUseCase.execute();

    emit(
      state.copyWith(
        previousQueries: previousQueries,
        repos: const <Repo>[],
        loadingStatus: LoadingStatus.idle,
      ),
    );
  }

  Future<void> _onDeleteQueryFromPreviousQueries(
    DeleteQueryFromPreviousQueries event,
    Emitter<HomeState> emit,
  ) async {
    final String query = event.query;

    await _deleteQueryFromPreviousQueriesUseCase.execute(query);
    final List<String> updatedQueries = _getPreviousQueriesUseCase.execute();

    emit(
      state.copyWith(previousQueries: updatedQueries),
    );
  }

  void _onToggleSearchHintText(
    ToggleSearchHintText event,
    Emitter<HomeState> emit,
  ) {
    final bool isSearching = event.isSearching;

    emit(
      state.copyWith(isSearching: isSearching),
    );
  }

  void _onToggleAppSearchTextFieldColor(
    ToggleAppSearchTextFieldColor event,
    Emitter<HomeState> emit,
  ) {
    final bool isFocused = event.isFocused;

    emit(
      state.copyWith(isFocused: isFocused),
    );
  }

  void _onPushRoute(
    PushRoute event,
    Emitter<HomeState> emit,
  ) {
    _appRouter.push(FavoritesRoute());
  }
}
