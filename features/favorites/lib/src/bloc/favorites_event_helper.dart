part of 'favorites_bloc.dart';

extension DeleteRepoFromFavoritesHelper on FavoritesBloc {
  void deleteRepoFromFavoritesAction(Repo repo) {
    add(DeleteRepoFromFavorites(repo));
  }
}

extension PopRouteHelper on FavoritesBloc {
  void popRouteAction() {
    add(PopRoute());
  }
}