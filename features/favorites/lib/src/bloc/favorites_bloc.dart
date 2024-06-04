import 'package:bloc/bloc.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesState()) {
    on<FavoritesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
