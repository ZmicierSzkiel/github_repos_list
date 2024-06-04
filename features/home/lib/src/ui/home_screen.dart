import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../bloc/home_bloc.dart';
import 'home_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeBloc(),
      child: const HomeContent(),
    );
  }
}
