import 'package:flutter/cupertino.dart';

import 'home/home_page.dart';

class DoctorPlannerApp extends StatelessWidget {

  const DoctorPlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Doctor Planner',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.systemBlue,
        brightness: Brightness.light,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
