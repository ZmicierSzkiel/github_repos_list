part of 'favorites_bloc.dart';

extension DeleteRepoFromFavoritesEventHelper on FavoritesBloc {
  void deleteRepoFromFavoritesAction(Repo repo) {
    add(DeleteRepoFromFavorites(repo));
  }
}

extension PopRouteEventHelper on FavoritesBloc {
  void popRouteAction() {
    add(PopRoute());
  }
}