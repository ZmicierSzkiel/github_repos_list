import 'package:flutter/material.dart';

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';

import '../bloc/favorites_bloc.dart';

class FavoritesContent extends StatelessWidget {
  const FavoritesContent({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height * 0.3;

    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (BuildContext context, FavoritesState state) {
        final List<Repo> favoriteRepos = state.favoriteRepos;
        final LoadingStatus loadingStatus = state.loadingStatus;

        return Scaffold(
          appBar: AppHeader(
            title: 'Favorite repos list',
            onPop: () => popRouteAction(context),
            isAnotherScreen: true,
          ),
          body: CustomScrollView(
            slivers: <Widget>[
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    <Widget>[
                      const SizedBox(
                        height: 25.0,
                      ),
                      if (loadingStatus == LoadingStatus.loading)
                        AppLoadingIndicator(),
                      if (favoriteRepos.isEmpty)
                        AppPlaceholder(
                          titleText: 'You have no favorites.',
                          bottomText:
                              'Click on star while searching to add first favorite',
                          padding: screenHeight,
                        ),
                    ],
                  ),
                ),
              ),
              if (favoriteRepos.isNotEmpty)
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: favoriteRepos.length,
                    (_, int index) {
                      final Repo favoriteRepo = favoriteRepos[index];
                      return AppDismissible(
                        title: favoriteRepo.name,
                        dismissableKey: favoriteRepo.id.toString(),
                        isRepo: true,
                        isFavorite: true,
                        onDismissed: (_) {
                          deleteRepoFromFavoritesAction(
                            context,
                            favoriteRepo,
                          );
                        },
                      );
                    },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  void deleteRepoFromFavoritesAction(BuildContext context, Repo repo) {
    context.read<FavoritesBloc>().deleteRepoFromFavoritesAction(repo);
  }

  void popRouteAction(BuildContext context) {
    context.read<FavoritesBloc>().popRouteAction();
  }
}
