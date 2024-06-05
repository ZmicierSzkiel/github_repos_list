import 'package:core/core.dart';
import 'package:navigation/navigation.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AppRouter _appRouter;

  SplashBloc({
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(const SplashState()) {
    on<PushHome>(_onPushHome);

    add(PushHome());
  }

  void _onPushHome(
    PushHome event,
    Emitter<SplashState> emit,
  ) {
    getIt.allReady().then((_) {
      _appRouter.push(HomeRoute());
    });
  }
}
