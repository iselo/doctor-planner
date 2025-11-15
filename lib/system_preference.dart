import 'package:flutter/services.dart';

abstract final class SystemPreference {
  static void load() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
