import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';

abstract final class SystemPreference {
  static Future<void> load() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    await initializeDateFormatting("en");
    await initializeDateFormatting("uk");
  }
}
