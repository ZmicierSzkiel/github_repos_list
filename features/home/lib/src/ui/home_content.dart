import 'package:flutter/material.dart';

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';

import '../bloc/home_bloc.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final FocusNode _searchFocusNode = FocusNode();
  final TextEditingController _searchEditingController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchFocusNode.addListener(toggleAppSearchTextFieldColorAction);
    _searchEditingController.addListener(toggleSearchHintTextAction);
  }

  @override
  void dispose() {
    super.dispose();
    _searchFocusNode.removeListener(toggleAppSearchTextFieldColorAction);
    _searchEditingController.removeListener(toggleSearchHintTextAction);

    _searchEditingController.dispose();
    _searchFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height * 0.25;

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (BuildContext context, HomeState state) {
        final bool isSearching = state.isSearching;
        final bool isFocused = state.isFocused;
        final LoadingStatus loadingStatus = state.loadingStatus;
        final List<Repo> repos = state.repos;

        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Scaffold(
            appBar: AppHeader(
              title: 'Github repos list',
              onPush: () => pushRouteAction(context),
              isAnotherScreen: false,
            ),
            body: CustomScrollView(
              physics: loadingStatus == LoadingStatus.idle || repos.isEmpty
                  ? const NeverScrollableScrollPhysics()
                  : null,
              slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      <Widget>[
                        const SizedBox(
                          height: 25.0,
                        ),
                        AppSearchTextField(
                          focusNode: _searchFocusNode,
                          controller: _searchEditingController,
                          hintText: 'Search',
                          isFocused: isFocused,
                          onClearTextField: _clearAppSearchTextField,
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        AppSearchHintText(isSearching: isSearching),
                        const SizedBox(
                          height: 7.0,
                        ),
                      ],
                    ),
                  ),
                ),
                if (loadingStatus == LoadingStatus.idle && repos.isEmpty)
                  SliverToBoxAdapter(
                    child: AppPlaceholder(
                      titleText: 'You have empty history.',
                      bottomText: 'Click on search to start journey!',
                      padding: screenHeight,
                    ),
                  ),
                if (loadingStatus == LoadingStatus.success && repos.isEmpty)
                  SliverToBoxAdapter(
                    child: AppPlaceholder(
                      titleText: 'Nothing was found on your search.',
                      bottomText: 'Please check the spelling',
                      padding: screenHeight,
                    ),
                  ),
                if (loadingStatus == LoadingStatus.loading)
                  SliverToBoxAdapter(
                    child: AppLoadingIndicator(),
                  ),
                if (loadingStatus == LoadingStatus.success)
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: repos.length,
                      (_, int index) {
                        final Repo repo = repos[index];

                        return AppListTile(
                          repoName: repo.name,
                          onPressed: () {},
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  void toggleSearchHintTextAction() {
    context.read<HomeBloc>().toggleSearchHintTextAction(
          _searchEditingController.text.isNotEmpty,
        );
  }

  void toggleAppSearchTextFieldColorAction() {
    context.read<HomeBloc>().toggleAppSearchTextFieldColorAction(
          _searchFocusNode.hasFocus,
        );
  }

  void pushRouteAction(BuildContext context) {
    context.read<HomeBloc>().pushRouteAction();
  }

  void _clearAppSearchTextField() {
    _searchEditingController.clear();
  }
}
