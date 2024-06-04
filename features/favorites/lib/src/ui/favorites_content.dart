import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../bloc/favorites_bloc.dart';

class FavoritesContent extends StatelessWidget {
  const FavoritesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (BuildContext context, FavoritesState state) {
        return const Placeholder();
      },
    );
  }
}
