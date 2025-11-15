import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../data/database_provider.dart';
import 'patient_model.dart';

class AddPatientPage extends ConsumerStatefulWidget {
  const AddPatientPage({super.key});

  @override
  ConsumerState<AddPatientPage> createState() => _AddPatientPageState();
}

class _AddPatientPageState extends ConsumerState<AddPatientPage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _uuid = Uuid();

  Future<void> _onSave() async {
    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final phone = _phoneController.text.trim();

    if (firstName.isEmpty || lastName.isEmpty) return;

    final patient = PatientModel(
      id: _uuid.v4(),
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phone.isEmpty ? null : phone,
    );

    final service = ref.read(DatabaseProvider.instance().patientServiceProvider());
    await service.add(patient);

    if (!mounted) return;

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("Add Patient"),
        previousPageTitle: "Patients",
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: _onSave,
          child: const Text("Done"),
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildTextField("First Name", _firstNameController),
              _buildTextField("Last Name", _lastNameController),
              _buildTextField(
                "Phone Number",
                _phoneController,
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String placeholder,
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: CupertinoTextField(
        controller: controller,
        placeholder: placeholder,
        keyboardType: keyboardType,
        clearButtonMode: OverlayVisibilityMode.editing,
      ),
    );
  }
}
