import 'package:flutter/cupertino.dart';

import '../appointments/appointment_tab_view.dart';
import '../patients/patient_tab_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const int _initialIndex = 0;

  late CupertinoTabController _tabController;
  late List<Widget> _tabs;

  @override
  void initState() {
    super.initState();
    _tabController = CupertinoTabController(initialIndex: _initialIndex);
    _tabs = [PatientTabView(), AppointmentTabView()];
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      controller: _tabController,
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_crop_circle_fill),
            label: 'Patients',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.calendar_today),
            label: 'Appointments',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) => _tabs[index],
        );
      },
    );
  }
}
