import 'package:core/core.dart';
import 'package:navigation/navigation.dart';

part 'home_event.dart';
part 'home_event_helper.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AppRouter _appRouter;

  HomeBloc({required AppRouter appRouter})
      : _appRouter = appRouter,
        super(HomeState()) {
    on<ToggleSearchHintText>(_onToggleSearchHintText);
    on<ToggleAppSearchTextFieldColor>(_onToggleAppSearchTextFieldColor);
    on<PushRoute>(_onPushRoute);
  }

  void _onToggleSearchHintText(
    ToggleSearchHintText event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(
        isSearching: event.isSearching,
      ),
    );
  }

  void _onToggleAppSearchTextFieldColor(
    ToggleAppSearchTextFieldColor event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(isFocused: event.isFocused),
    );
  }

  void _onPushRoute(
    PushRoute event,
    Emitter<HomeState> emit,
  ) {
    _appRouter.push(FavoritesRoute());
  }
}
