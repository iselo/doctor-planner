import 'package:flutter/cupertino.dart';

extension WidgetOptionalExt on Widget {
  /// Returns the widget if [predicate] is true, otherwise returns SizedBox.shrink()
  Widget visibleIf(bool predicate) =>
      predicate ? this : const SizedBox.shrink();
}
