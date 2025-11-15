import '../data/app_database.dart';
import 'patients_dao.dart';

/// Repository for Patients-related operations
final class PatientRepository {
  final PatientsDao _dao;

  PatientRepository(this._dao);

  Future<void> add(PatientsCompanion patient) => _dao.insertPatient(patient);

  Future<Patient?> findById(String id) => _dao.findPatientById(id);

  Future<void> update(PatientsCompanion patient) => _dao.updatePatient(patient);

  Future<void> remove(String id) => _dao.deletePatient(id);

  Stream<List<Patient>> watchAll() => _dao.watchAllPatients();
}
