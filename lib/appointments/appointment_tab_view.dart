import 'package:flutter/cupertino.dart';

import '../l10n/app_localizations.dart';

final class AppointmentTabView extends StatelessWidget {
  const AppointmentTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10nText = AppLocalizations.of(context)!;
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
              largeTitle: Text(l10nText.appointments),
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
