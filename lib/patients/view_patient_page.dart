import 'package:flutter/cupertino.dart';

class ViewPatientPage extends StatelessWidget {
  const ViewPatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGrey6,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(parent: ClampingScrollPhysics()),
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text("Nobody Nobody"),
            previousPageTitle: 'Patients',
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              child: Text("Edit"),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                CupertinoListSection.insetGrouped(
                  children: [
                    CupertinoListTile(
                      padding: EdgeInsets.all(16),
                      title: Text("birthday"),
                      subtitle: Text(
                        "16 October 2000",
                        style: CupertinoTheme.of(context).textTheme.textStyle
                            .copyWith(color: CupertinoColors.link),
                      ),
                    ),
                  ],
                ),
                CupertinoListSection.insetGrouped(
                  children: [
                    CupertinoListTile(
                      title: Text(
                        'Deactivate this Patient',
                        style: CupertinoTheme.of(context).textTheme.textStyle
                            .copyWith(color: CupertinoColors.destructiveRed),
                      ),
                    ),
                  ],
                ),
                CupertinoListSection.insetGrouped(
                  children: [
                    CupertinoListTile(
                      title: Text(
                        'Deactivate this Patient',
                        style: CupertinoTheme.of(context).textTheme.textStyle
                            .copyWith(color: CupertinoColors.destructiveRed),
                      ),
                    ),
                  ],
                ),
                CupertinoListSection.insetGrouped(
                  children: [
                    CupertinoListTile(
                      title: Text(
                        'Deactivate this Patient',
                        style: CupertinoTheme.of(context).textTheme.textStyle
                            .copyWith(color: CupertinoColors.destructiveRed),
                      ),
                    ),
                  ],
                ),
                CupertinoListSection.insetGrouped(
                  children: [
                    CupertinoListTile(
                      title: Text(
                        'Deactivate this Patient',
                        style: CupertinoTheme.of(context).textTheme.textStyle
                            .copyWith(color: CupertinoColors.destructiveRed),
                      ),
                    ),
                  ],
                ),
                CupertinoListSection.insetGrouped(
                  children: [
                    CupertinoListTile(
                      title: Text(
                        'Deactivate this Patient',
                        style: CupertinoTheme.of(context).textTheme.textStyle
                            .copyWith(color: CupertinoColors.destructiveRed),
                      ),
                    ),
                  ],
                ),
                CupertinoListSection.insetGrouped(
                  children: [
                    CupertinoListTile(
                      title: Text(
                        'Deactivate this Patient',
                        style: CupertinoTheme.of(context).textTheme.textStyle
                            .copyWith(color: CupertinoColors.destructiveRed),
                      ),
                    ),
                  ],
                ),
                CupertinoListSection.insetGrouped(
                  children: [
                    CupertinoListTile(
                      title: Text(
                        'Deactivate this Patient',
                        style: CupertinoTheme.of(context).textTheme.textStyle
                            .copyWith(color: CupertinoColors.destructiveRed),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      // child: SafeArea(
      //   child: ListView(
      //     physics: const BouncingScrollPhysics(parent: ClampingScrollPhysics()),
      //     children: [
      //       CupertinoListSection.insetGrouped(
      //         children: [
      //           CupertinoListTile(
      //             padding: EdgeInsets.symmetric(vertical: 6),
      //             title: Text("birthday"),
      //             subtitle: Text(
      //               "16 October 2000",
      //               style: CupertinoTheme.of(
      //                 context,
      //               ).textTheme.textStyle.copyWith(color: CupertinoColors.link),
      //             ),
      //           ),
      //         ],
      //       ),

      //     ],
      //   ),
      // ),
    );
  }
}
