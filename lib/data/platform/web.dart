import 'dart:js_interop';

import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';

abstract final class PlatformInterface {
  static final String _sqlite3WasmFile = 'sqlite3.wasm';
  static final String _driftWorkerJsFile = 'drift_worker.dart.js';

  static QueryExecutor createDatabaseConnection(String databaseName) {
    return DatabaseConnection.delayed(_newFuture(databaseName));
  }

  static Future<DatabaseConnection> _newFuture(final String databaseName) {
    return Future(() async {
      final base = Uri.parse(_location.href.toDart);
      final sqlite3Uri = base.resolve(_sqlite3WasmFile);
      final driftWorkerUri = Uri.parse(_driftWorkerJsFile);

      final database = await WasmDatabase.open(
        databaseName: databaseName,
        sqlite3Uri: sqlite3Uri,
        driftWorkerUri: driftWorkerUri,
      );
      return database.resolvedExecutor;
    });
  }
}

// JS getter for window.location.href
extension JSLocation on JSObject {
  external JSString get href;
}

@JS('window.location')
external JSObject _location;
