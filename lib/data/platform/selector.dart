import 'package:drift/drift.dart';

import 'unsupported.dart'
    if (dart.library.io) 'native.dart'
    if (dart.library.js_interop) 'web.dart';

abstract final class Platform {
  static QueryExecutor createDatabaseConnection(String databaseName) {
    return PlatformInterface.createDatabaseConnection(databaseName);
  }
}
