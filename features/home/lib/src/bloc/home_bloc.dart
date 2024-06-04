import 'package:core/core.dart';

part 'home_event.dart';
part 'home_event_helper.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<ToggleSearchHintText>(_onToggleSearchHintText);
    on<ToggleAppSearchTextFieldColor>(_onToggleAppSearchTextFieldColor);
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
}
