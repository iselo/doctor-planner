import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'home/home_page.dart';
import 'patients/patient.dart';

final List<Patient> patients = [
  Patient(firstName: 'John', lastName: 'Doe'),
  Patient(firstName: 'Jane', lastName: 'Doe'),
  Patient(firstName: 'Ray', lastName: 'Alen'),
  Patient(firstName: 'Tim', lastName: 'Cook'),
  Patient(firstName: 'Alice', lastName: 'Star'),
  Patient(firstName: 'Simon', lastName: 'Brown'),
  Patient(firstName: 'Ellie', lastName: 'White'),
  Patient(firstName: 'Sunny', lastName: 'Jonson'),
  Patient(firstName: 'Lucy', lastName: 'Huston'),
  Patient(firstName: 'Taylor', lastName: 'Smith'),
  Patient(firstName: 'Betty', lastName: 'Black')
];

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Doctor Planner',
      theme: CupertinoThemeData(primaryColor: CupertinoColors.systemBlue),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
