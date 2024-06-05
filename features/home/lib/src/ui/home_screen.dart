import 'package:flutter/material.dart';

import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

import '../bloc/home_bloc.dart';
import 'home_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeBloc(
        appRouter: getIt.get<AppRouter>(),
        deleteQueryFromPreviousQueriesUseCase:
            getIt.get<DeleteQueryFromPreviousQueriesUseCase>(),
        getFavoriteReposUseCase: getIt.get<GetFavoriteReposUseCase>(),
        getReposByQueryUseCase: getIt.get<GetReposByQueryUseCase>(),
        getPreviousQueriesUseCase: getIt.get<GetPreviousQueriesUseCase>(),
        setFavoriteRepoUseCase: getIt.get<SetFavoriteRepoUseCase>(),
        setQueryToPreviousQueriesUseCase:
            getIt.get<SetQueryToPreviousQueriesUseCase>(),
      ),
      child: const HomeContent(),
    );
  }
}
