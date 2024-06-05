part of 'favorites_bloc.dart';

sealed class FavoritesEvent {
  const FavoritesEvent();
}

final class GetFavoriteReposList extends FavoritesEvent {
  const GetFavoriteReposList();
}

final class DeleteRepoFromFavorites extends FavoritesEvent {
  final Repo repo;

  const DeleteRepoFromFavorites(this.repo);
}

final class PopRoute extends FavoritesEvent {
  const PopRoute();
}