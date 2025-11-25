import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

extension L10nDateExt on DateTime {
  String toL10n(BuildContext context) => _L10nDate.format(context, this);
}

abstract final class _L10nDate {
  static String format(BuildContext context, DateTime date) {
    final locale = Localizations.localeOf(context).toString();
    return DateFormat.yMMMd(locale).format(date);
  }
}
