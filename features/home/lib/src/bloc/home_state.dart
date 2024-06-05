part of 'home_bloc.dart';

class HomeState {
  final List<Repo> repos;
  final List<String> previousQueries;
  final bool isSearching;
  final bool isFocused;
  final LoadingStatus loadingStatus;

  const HomeState({
    this.repos = const <Repo>[],
    this.previousQueries = const <String>[],
    this.isSearching = false,
    this.isFocused = false,
    this.loadingStatus = LoadingStatus.idle,
  });

  HomeState copyWith({
    List<Repo>? repos,
    List<String>? previousQueries,
    bool? isSearching,
    bool? isFocused,
    LoadingStatus? loadingStatus,
  }) {
    return HomeState(
      repos: repos ?? this.repos,
      previousQueries: previousQueries ?? this.previousQueries,
      isSearching: isSearching ?? this.isSearching,
      isFocused: isFocused ?? this.isFocused,
      loadingStatus: loadingStatus ?? this.loadingStatus,
    );
  }
}
