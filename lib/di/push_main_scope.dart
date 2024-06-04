import 'package:core/core.dart';
import 'package:data/data.dart';

void pushMainScope() {
  coreDI.setup();
  dataDI.setup();
}