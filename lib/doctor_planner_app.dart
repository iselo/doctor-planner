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
        textTheme: CupertinoTextThemeData(
          textStyle: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
            letterSpacing: -0.41,
            height: 1.2,
          ),
        ),
      ),
      scrollBehavior: const CupertinoScrollBehavior(),

      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
