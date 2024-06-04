part of 'home_bloc.dart';

class HomeState {
  final bool isSearching;
  final bool isFocused;
  final LoadingStatus loadingStatus;

  const HomeState({
    this.isSearching = false,
    this.isFocused = false,
    this.loadingStatus = LoadingStatus.idle,
  });

  HomeState copyWith({
    bool? isSearching,
    bool? isFocused,
    LoadingStatus? loadingStatus,
  }) {
    return HomeState(
      isSearching: isSearching ?? this.isSearching,
      isFocused: isFocused ?? this.isFocused,
      loadingStatus: loadingStatus ?? this.loadingStatus,
    );
  }
}
