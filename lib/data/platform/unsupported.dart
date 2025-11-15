import 'package:drift/drift.dart';

abstract final class PlatformInterface {
  static QueryExecutor createDatabaseConnection(String databaseName) {
    throw UnsupportedError(
      'Cannot create a client without dart:html or dart:io',
    );
  }
}
