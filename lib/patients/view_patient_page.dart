import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/database_provider.dart';

class ViewPatientPage extends ConsumerWidget {
  final String _patientId;

  const ViewPatientPage({super.key, required String patientId})
    : _patientId = patientId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final patientAsync = ref.watch(
      DatabaseProvider.instance().patientStreamProvider(_patientId),
    );
    return patientAsync.when(
      data: (patient) {
        return CupertinoPageScaffold(
          backgroundColor: CupertinoColors.systemGrey6,
          child: SafeArea(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(
                parent: ClampingScrollPhysics(),
              ),
              slivers: <Widget>[
                CupertinoSliverNavigationBar(
                  largeTitle: Text('${patient.firstName} ${patient.lastName}'),
                  previousPageTitle: 'Patients',
                  trailing: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: Text("Edit"),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    if (patient.phoneNumber?.isNotEmpty ?? false)
                      CupertinoListSection.insetGrouped(
                        margin: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        children: [
                          CupertinoListTile(
                            padding: EdgeInsets.all(16),
                            title: Text("phone number"),
                            subtitle: Text(
                              patient.phoneNumber!,
                              style: CupertinoTheme.of(context)
                                  .textTheme
                                  .textStyle
                                  .copyWith(color: CupertinoColors.link),
                            ),
                          ),
                        ],
                      ),
                    CupertinoListSection.insetGrouped(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      children: [
                        CupertinoListTile(
                          padding: EdgeInsets.all(16),
                          title: Text("birthday"),
                          subtitle: Text(
                            "16 October 2000",
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .textStyle
                                .copyWith(color: CupertinoColors.link),
                          ),
                        ),
                      ],
                    ),
                    CupertinoListSection.insetGrouped(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      children: [
                        CupertinoListTile(
                          padding: EdgeInsets.all(16),
                          title: Text("section"),
                          subtitle: Text(
                            "Some Data",
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .textStyle
                                .copyWith(color: CupertinoColors.link),
                          ),
                        ),
                      ],
                    ),
                    CupertinoListSection.insetGrouped(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      children: [
                        CupertinoListTile(
                          padding: EdgeInsets.all(16),
                          title: Text("another section"),
                          subtitle: Text(
                            "Some Data",
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .textStyle
                                .copyWith(color: CupertinoColors.link),
                          ),
                        ),
                      ],
                    ),
                    CupertinoListSection.insetGrouped(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      children: [
                        CupertinoListTile(
                          padding: EdgeInsets.all(16),
                          title: Text("one more section"),
                          subtitle: Text(
                            "Some Data",
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .textStyle
                                .copyWith(color: CupertinoColors.link),
                          ),
                        ),
                      ],
                    ),
                    CupertinoListSection.insetGrouped(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      children: [
                        CupertinoListTile(
                          title: Text(
                            patient.isActive
                                ? "Deactivate this Patient"
                                : "Activate this Patient",
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .textStyle
                                .copyWith(
                                  color: CupertinoColors.destructiveRed,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              ],
            ),
          ),
        );
      },
      loading: () => const Center(child: CupertinoActivityIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
    );
  }
}
