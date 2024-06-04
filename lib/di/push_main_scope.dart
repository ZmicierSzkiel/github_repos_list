import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:navigation/navigation.dart';

void pushMainScope(Flavor flavor) {
  coreDI.setup(flavor: flavor);
  navigationDI.setup();
  dataDI.setup();
}