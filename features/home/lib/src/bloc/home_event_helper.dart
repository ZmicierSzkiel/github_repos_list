part of 'home_bloc.dart';

extension GetReposByQueryHelper on HomeBloc {
  void getReposByQueryAction(String query) {
    add(GetReposByQuery(query));
  }
}

extension SetFavoriteRepoHelper on HomeBloc {
  void setFavoriteRepoAction(Repo repo) {
    add(SetFavoriteRepo(repo));
  }
}

extension ClearTextFieldHelper on HomeBloc {
  void clearTextFieldAction() {
    add(ClearTextField());
  }
}

extension DeleteAppListTileHelper on HomeBloc {
  void deleteQueryFromPreviousQueriesAction(String query) {
    add(DeleteQueryFromPreviousQueries(query));
  }
}

extension ToggleWidgetStyleHelper on HomeBloc {
  void toggleSearchHintTextAction(bool isSearching) {
    add(ToggleSearchHintText(isSearching));
  }

  void toggleAppSearchTextFieldColorAction(bool isFocused) {
    add(ToggleAppSearchTextFieldColor(isFocused));
  }
}

extension PushRouteHelper on HomeBloc {
  void pushRouteAction() {
    add(PushRoute());
  }
}
