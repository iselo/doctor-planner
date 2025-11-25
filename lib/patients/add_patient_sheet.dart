import 'package:doctor_planer/l10n/l10n_date_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../data/database_provider.dart';
import '../l10n/app_localizations.dart';
import 'patient_model.dart';

class AddPatientSheet extends ConsumerStatefulWidget {
  const AddPatientSheet({super.key});

  @override
  ConsumerState<AddPatientSheet> createState() => _AddPatientSheetState();
}

class _AddPatientSheetState extends ConsumerState<AddPatientSheet> {
  static const double sectionSpacing = 24.0;

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _focusNode = FocusNode();
  final _uuid = Uuid();

  DateTime? _selectedBirthday;

  @override
  void initState() {
    super.initState();

    _firstNameController.addListener(() {
      setState(() {});
    });
    _lastNameController.addListener(() {
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _focusNode.requestFocus(),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10nText = AppLocalizations.of(context)!;
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGrey6,
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => CupertinoSheetRoute.popSheet(context),
          child: Text(l10nText.cancel),
        ),
        middle: Text(l10nText.newPatient),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: _isNameEmpty ? null : _onSave,
          child: Text(
            l10nText.done,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: _isNameEmpty
                  ? CupertinoColors.inactiveGray
                  : CupertinoColors.activeBlue,
            ),
          ),
        ),
      ),
      child: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(parent: ClampingScrollPhysics()),
          children: [
            CupertinoFormSection(
              children: [
                _newCupertinoFormRow(
                  l10nText.firstName,
                  _firstNameController,
                  focusNode: _focusNode,
                ),
                _newCupertinoFormRow(l10nText.lastName, _lastNameController),
              ],
            ),
            const SizedBox(height: sectionSpacing),
            CupertinoFormSection(
              children: [
                _newCupertinoFormRow(
                  l10nText.phoneNumber,
                  _phoneController,
                  keyboardType: TextInputType.phone,
                ),
              ],
            ),
            const SizedBox(height: sectionSpacing),
            CupertinoFormSection(
              children: [
                CupertinoFormRow(
                  prefix: GestureDetector(
                    onTap: () => _showDatePicker(context),
                    child: Icon(
                      CupertinoIcons.add_circled_solid,
                      color: CupertinoColors.systemGreen,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () => _showDatePicker(context),
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 16,
                      ),
                      child: Text(
                        _selectedBirthday == null
                            ? l10nText.addBirthday
                            : _selectedBirthday!.toL10n(context),
                        // : L10nDate.format(context, _selectedBirthday!),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _newCupertinoFormRow(
    String placeholder,
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
    focusNode,
  }) {
    return CupertinoFormRow(
      child: CupertinoTextField(
        padding: EdgeInsets.symmetric(vertical: 6),
        controller: controller,
        placeholder: placeholder,
        placeholderStyle: CupertinoTheme.of(
          context,
        ).textTheme.textStyle.copyWith(color: CupertinoColors.secondaryLabel),
        keyboardType: keyboardType,
        clearButtonMode: OverlayVisibilityMode.editing,
        decoration: const BoxDecoration(),
        focusNode: focusNode,
      ),
    );
  }

  void _showDatePicker(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system
        // navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground,
        child: SafeArea(
          top: false,
          child: CupertinoDatePicker(
            initialDateTime: _selectedBirthday ?? DateTime.now(),
            minimumDate: DateTime(1900, 1, 1),
            maximumDate: DateTime.now(),
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (DateTime newDate) {
              setState(() => _selectedBirthday = newDate);
            },
          ),
        ),
      ),
    );
  }

  Future<void> _onSave() async {
    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();

    if (firstName.isEmpty || lastName.isEmpty) return;

    final phone = _phoneController.text.trim();

    final patient = PatientModel(
      id: _uuid.v4(),
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phone.isEmpty ? null : phone,
      birthday: _selectedBirthday,
    );

    final service = ref.read(
      DatabaseProvider.instance().patientServiceProvider(),
    );
    await service.add(patient);

    if (!mounted) return;

    CupertinoSheetRoute.popSheet(context);
  }

  bool get _isNameEmpty {
    return _firstNameController.text.trim().isEmpty ||
        _lastNameController.text.trim().isEmpty;
  }
}
