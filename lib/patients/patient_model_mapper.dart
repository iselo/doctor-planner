import 'package:drift/drift.dart';

import '../data/app_database.dart';
import 'patient_model.dart';

extension PatientModelMapper on PatientModel {
  PatientsCompanion toCompanion() {
    return PatientsCompanion.insert(
      id: id,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: Value(phoneNumber),
      isActive: Value(isActive),
    );
  }
}
