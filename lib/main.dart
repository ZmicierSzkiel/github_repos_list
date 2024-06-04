import 'package:flutter/material.dart';

import 'di/init_di.dart';

import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  initDI();

  runApp(const App());
}
