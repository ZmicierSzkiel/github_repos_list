part of 'favorites_bloc.dart';

class FavoritesState {
  final List<Repo> favoriteRepos;
  final LoadingStatus loadingStatus;

  const FavoritesState({
    this.favoriteRepos = const <Repo>[],
    this.loadingStatus = LoadingStatus.idle,
  });

  FavoritesState copyWith({
    List<Repo>? favoriteRepos,
    LoadingStatus? loadingStatus,
  }) {
    return FavoritesState(
      favoriteRepos: favoriteRepos ?? this.favoriteRepos,
      loadingStatus: loadingStatus ?? this.loadingStatus,
    );
  }
}
