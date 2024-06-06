import 'package:core/core.dart';

import '../dio/dio.dart';
import '../favorites/favorites.dart';
import '../hive/hive.dart';
import '../home/home.dart';

const DataDI dataDI = DataDI();

class DataDI extends SingleZoneDI {
  const DataDI();

  @override
  void setup() {
    dioDI.setup();
    hiveDI.setup();
    homeDI.setup();
    favoritesDI.setup();
  }
}
