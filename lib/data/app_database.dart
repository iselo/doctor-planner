import 'package:drift/drift.dart';

import '../patients/patients.dart';
import 'platform/selector.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Patients])
class AppDatabase extends _$AppDatabase {
  static final String _name = 'patients';

  AppDatabase() : super(Platform.createDatabaseConnection(AppDatabase._name));

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (m, from, to) async {
      if (from == 1) {
        await m.addColumn(patients, patients.birthday);
      }
    },
  );
}
