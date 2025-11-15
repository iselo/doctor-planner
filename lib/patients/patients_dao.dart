import 'package:drift/drift.dart';

import '../data/app_database.dart';
import 'patients.dart';

part 'patients_dao.g.dart'; // Needed for code generation

@DriftAccessor(tables: [Patients])
class PatientsDao extends DatabaseAccessor<AppDatabase>
    with _$PatientsDaoMixin {
  PatientsDao(super.db);

  /// Insert a single patient
  Future<int> insertPatient(PatientsCompanion patient) {
    return into(db.patients).insert(patient);
  }

  /// Obtains a single patient by given id
  Future<Patient?> findPatientById(String id) {
    final selectStatement = (select(patients)
      ..where((p) => p.id.equals(id)));
    return selectStatement.getSingleOrNull();
  }

  /// Updates patient and returns number of rows updated
  Future<int> updatePatient(PatientsCompanion patient) {
    final updateStatement = (update(db.patients)
      ..where((p) => p.id.equals(patient.id.value)));
    return updateStatement.write(patient);
  }
  /// Delete patient by given id
  Future<int> deletePatient(String id) {
    final deleteStatement = (delete(db.patients)
      ..where((p) => p.id.equals(id)));
    return deleteStatement.go();
  }

  /// Watch all patients as a stream (reactive)
  Stream<List<Patient>> watchAllPatients() {
    final selectStatement = (select(patients)
      ..orderBy([(p) => OrderingTerm.asc(p.lastName)]));
    return selectStatement.watch();
  }
}
