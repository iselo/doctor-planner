final class PatientModel {
  final String id;
  final String firstName;
  final String lastName;
  final String? phoneNumber;
  final DateTime? birthday;
  final bool isActive;

  PatientModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.phoneNumber,
    this.birthday,
    this.isActive = true,
  });
}
