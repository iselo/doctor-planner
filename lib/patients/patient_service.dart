import '../data/app_database.dart';
import 'patient_model.dart';
import 'patient_model_mapper.dart';
import 'patient_repository.dart';

final class PatientService {
  final PatientRepository repository;

  PatientService(this.repository);

  Future<void> add(PatientModel patient) async {
    final companion = patient.toCompanion();
    repository.add(companion);
  }

  Future<Patient?> findById(String id) {
    return repository.findById(id);
  }

  Future<void> update(PatientModel patient) async {
    final companion = patient.toCompanion();
    return repository.update(companion);
  }

  Future<void> remove(String id) {
    return repository.remove(id);
  }

  Stream<List<Patient>> watchAll() {
    return repository.watchAll();
  }
}
