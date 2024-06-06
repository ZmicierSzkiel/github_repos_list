part of 'home_bloc.dart';

extension GetReposByQueryEventHelper on HomeBloc {
  void getReposByQueryAction(String query) {
    add(GetReposByQuery(query));
  }
}

extension SetFavoriteRepoEventHelper on HomeBloc {
  void setFavoriteRepoAction(Repo repo) {
    add(SetFavoriteRepo(repo));
  }
}

extension ClearTextFieldEventHelper on HomeBloc {
  void clearTextFieldAction() {
    add(ClearTextField());
  }
}

extension DeleteAppListTileEventHelper on HomeBloc {
  void deleteQueryFromPreviousQueriesAction(String query) {
    add(DeleteQueryFromPreviousQueries(query));
  }
}

extension ToggleWidgetStyleEventHelper on HomeBloc {
  void toggleSearchHintTextAction(bool isSearching) {
    add(ToggleSearchHintText(isSearching));
  }

  void toggleAppSearchTextFieldColorAction(bool isFocused) {
    add(ToggleAppSearchTextFieldColor(isFocused));
  }
}

extension PushRouteEventHelper on HomeBloc {
  void pushRouteAction() {
    add(PushRoute());
  }
}
