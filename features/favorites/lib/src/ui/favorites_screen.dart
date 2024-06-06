import 'package:flutter/material.dart';

import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

import '../bloc/favorites_bloc.dart';
import 'favorites_content.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => FavoritesBloc(
        appRouter: getIt.get<AppRouter>(),
        deleteRepoFromFavoritesUseCase:
            getIt.get<DeleteRepoFromFavoritesUseCase>(),
        getFavoriteReposListUseCase: getIt.get<GetFavoriteReposListUseCase>(),
      ),
      child: const FavoritesContent(),
    );
  }
}
