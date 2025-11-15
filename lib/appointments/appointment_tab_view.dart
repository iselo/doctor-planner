import 'package:flutter/cupertino.dart';

final class AppointmentTabView extends StatelessWidget {
  const AppointmentTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text('Appointments'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Icon(CupertinoIcons.search),
                  onPressed: () {},
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Icon(CupertinoIcons.add),
                  onPressed: () {},
                ),
              ],
            )
          ),
          SliverFillRemaining(child: Container()),
        ],
      ),
    );
  }
}
