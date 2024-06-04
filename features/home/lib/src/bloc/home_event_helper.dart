part of 'home_bloc.dart';

extension ToggleWidgetStyleHelper on HomeBloc {
  void toggleSearchHintTextAction(bool isSearching) {
    add(ToggleSearchHintText(isSearching));
  }

  void toggleAppSearchTextFieldColorAction(bool isFocused) {
    add(ToggleAppSearchTextFieldColor(isFocused));
  }
}
