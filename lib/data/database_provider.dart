import 'package:doctor_planer/data/app_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../patients/patient_repository.dart';
import '../patients/patient_service.dart';
import '../patients/patients_dao.dart';

/// Singleton wrapper for AppDatabase provider
final class DatabaseProvider {
  static final DatabaseProvider _instance = DatabaseProvider._private();

  /// Riverpod provider for AppDatabase
  final _provider = Provider<AppDatabase>((ref) {
    final db = AppDatabase(); // single instance per ProviderScope
    ref.onDispose(() => db.close());
    return db;
  });

  late final _patientsDaoProvider = Provider<PatientsDao>((ref) {
    final db = ref.watch(_provider);
    return PatientsDao(db);
  });

  late final _patientRepositoryProvider = Provider<PatientRepository>((ref) {
    final dao = ref.watch(_patientsDaoProvider);
    return PatientRepository(dao);
  });

  /// Riverpod provider for PatientService
  late final _patientServiceProvider = Provider<PatientService>((ref) {
    final repository = ref.watch(_patientRepositoryProvider);
    return PatientService(repository);
  });


  DatabaseProvider._private();

  factory DatabaseProvider.instance() {
    return _instance;
  }

  Provider<PatientService> patientServiceProvider() {
    return _patientServiceProvider;
  }
}
