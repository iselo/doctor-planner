// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get cancel => 'Скасуваити';

  @override
  String get done => 'Готово';

  @override
  String get edit => 'Змінити';

  @override
  String get search => 'Пошук';

  @override
  String get patients => 'Пацієнти';

  @override
  String get newPatient => 'Новий пацієнт';

  @override
  String get firstName => 'Ім\'я';

  @override
  String get lastName => 'Прізвище';

  @override
  String get phoneNumber => 'Телефон';

  @override
  String get birthday => 'день народження';

  @override
  String get addBirthday => 'додати день народження';

  @override
  String get activateThisPatient => 'Активувати пацієнта';

  @override
  String get deactivateThisPatient => 'Декативувати пацієнта';

  @override
  String get appointments => 'Прийоми';

  @override
  String get error => 'Помилка';
}
