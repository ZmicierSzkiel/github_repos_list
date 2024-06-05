import 'package:flutter/material.dart';

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';

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

        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Scaffold(
            appBar: AppHeader(
              title: 'Github repos list',
              onPush: () => pushRouteAction(context),
              isAnotherScreen: false,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
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
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight),
                    child: Stack(
                      children: <Widget>[
                        if (loadingStatus == LoadingStatus.loading)
                          AppLoadingIndicator()
                        else if (loadingStatus == LoadingStatus.preparing)
                          const SizedBox.shrink()
                        else
                          AppPlaceholder(
                            titleText: 'You have empty history.',
                            bottomText: 'Click on search to start journey!',
                          ),
                      ],
                    ),
                  ),
                ],
              ),
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
