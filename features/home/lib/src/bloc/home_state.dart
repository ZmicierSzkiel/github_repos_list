part of 'home_bloc.dart';

class HomeState {
  final List<Repo> repos;
  final bool isSearching;
  final bool isFocused;
  final LoadingStatus loadingStatus;

  const HomeState({
    required this.repos,
    this.isSearching = false,
    this.isFocused = false,
    this.loadingStatus = LoadingStatus.idle,
  });

  HomeState copyWith({
    List<Repo>? repos,
    bool? isSearching,
    bool? isFocused,
    LoadingStatus? loadingStatus,
  }) {
    return HomeState(
      repos: repos ?? this.repos,
      isSearching: isSearching ?? this.isSearching,
      isFocused: isFocused ?? this.isFocused,
      loadingStatus: loadingStatus ?? this.loadingStatus,
    );
  }
}
