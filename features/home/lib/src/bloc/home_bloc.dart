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
  final GetReposByQueryUseCase _getReposByQueryUseCase;
  final GetPreviousQueriesUseCase _getPreviousQueriesUseCase;
  final SetQueryToPreviousQueriesUseCase _setQueryToPreviousQueriesUseCase;

  HomeBloc({
    required AppRouter appRouter,
    required DeleteQueryFromPreviousQueriesUseCase
        deleteQueryFromPreviousQueriesUseCase,
    required GetReposByQueryUseCase getReposByQueryUseCase,
    required GetPreviousQueriesUseCase getPreviousQueriesUseCase,
    required SetQueryToPreviousQueriesUseCase setQueryToPreviousQueriesUseCase,
  })  : _appRouter = appRouter,
        _deleteQueryFromPreviousQueriesUseCase =
            deleteQueryFromPreviousQueriesUseCase,
        _getReposByQueryUseCase = getReposByQueryUseCase,
        _getPreviousQueriesUseCase = getPreviousQueriesUseCase,
        _setQueryToPreviousQueriesUseCase = setQueryToPreviousQueriesUseCase,
        super(const HomeState()) {
    on<GetReposByQuery>(_onGetReposByQuery);
    on<GetPreviousQueries>(_onGetPreviousQueries);
    on<ClearTextField>(_onClearTextField);
    on<DeleteQueryFromPreviousQueries>(_onDeleteQueryFromPreviousQueries);
    on<ToggleSearchHintText>(_onToggleSearchHintText);
    on<ToggleAppSearchTextFieldColor>(_onToggleAppSearchTextFieldColor);
    on<PushRoute>(_onPushRoute);

    add(GetPreviousQueries());
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

    emit(
      state.copyWith(
        repos: repos,
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
