import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

part 'home_event.dart';
part 'home_event_helper.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AppRouter _appRouter;
  final GetReposByQueryUseCase _getReposByQueryUseCase;

  HomeBloc({
    required AppRouter appRouter,
    required GetReposByQueryUseCase getReposByQueryUseCase,
  })  : _appRouter = appRouter,
        _getReposByQueryUseCase = getReposByQueryUseCase,
        super(
          HomeState(repos: <Repo>[]),
        ) {
    on<GetReposByQuery>(_onGetReposByQuery);
    on<ToggleSearchHintText>(_onToggleSearchHintText);
    on<ToggleAppSearchTextFieldColor>(_onToggleAppSearchTextFieldColor);
    on<PushRoute>(_onPushRoute);
  }

  Future<void> _onGetReposByQuery(
    GetReposByQuery event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(loadingStatus: LoadingStatus.loading),
    );

    final String query = event.query;

    final List<Repo> repos = await _getReposByQueryUseCase.execute(query);

    emit(
      state.copyWith(
        repos: repos,
        loadingStatus: LoadingStatus.success,
      ),
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
