import 'package:flutter/material.dart';

import 'package:core/core.dart';

import '../di/init_di.dart';
import '../app.dart';

Future<void> mainCommon({required Flavor flavor}) async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  initDI(flavor);
  runApp(const App());
}
