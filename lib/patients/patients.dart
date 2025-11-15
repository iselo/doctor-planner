import 'package:drift/drift.dart';

class Patients extends Table {
  TextColumn get id => text()();

  TextColumn get firstName => text().withLength(min: 1, max: 50)();

  TextColumn get lastName => text().withLength(min: 1, max: 50)();

  TextColumn get phoneNumber => text().nullable()();

  BoolColumn get isActive => boolean().withDefault(Constant(true))();

  @override
  Set<Column> get primaryKey => {id};
}
