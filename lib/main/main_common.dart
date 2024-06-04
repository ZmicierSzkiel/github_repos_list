import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../di/init_di.dart';

import '../app.dart';

void mainCommon({required Flavor flavor}) {
  WidgetsFlutterBinding.ensureInitialized();

  initDI(flavor);

  runApp(const App());
}
