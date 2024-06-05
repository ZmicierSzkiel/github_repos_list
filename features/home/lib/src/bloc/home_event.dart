part of 'home_bloc.dart';

sealed class HomeEvent {
  const HomeEvent();
}

final class GetReposByQuery extends HomeEvent{
  final String query;

  const GetReposByQuery(this.query);
}

final class ToggleSearchHintText extends HomeEvent {
  final bool isSearching;

  const ToggleSearchHintText(this.isSearching);
}

final class ToggleAppSearchTextFieldColor extends HomeEvent {
  final bool isFocused;

  const ToggleAppSearchTextFieldColor(this.isFocused);
}

final class PushRoute extends HomeEvent {
  const PushRoute();
}