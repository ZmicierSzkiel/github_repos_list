import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../bloc/favorites_bloc.dart';
import 'favorites_content.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => FavoritesBloc(),
      child: const FavoritesContent(),
    );
  }
}
