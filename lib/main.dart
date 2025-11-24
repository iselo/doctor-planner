import 'package:doctor_planer/system_preference.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'doctor_planner_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemPreference.load();
  runApp(ProviderScope(child: DoctorPlannerApp()));
}
