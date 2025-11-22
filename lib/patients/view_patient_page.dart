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
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .textStyle
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
                    CupertinoListSection.insetGrouped(
                      children: [
                        CupertinoListTile(
                          title: Text(
                            'Deactivate this Patient',
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
                    CupertinoListSection.insetGrouped(
                      children: [
                        CupertinoListTile(
                          title: Text(
                            'Deactivate this Patient',
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
                    CupertinoListSection.insetGrouped(
                      children: [
                        CupertinoListTile(
                          title: Text(
                            'Deactivate this Patient',
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
                    CupertinoListSection.insetGrouped(
                      children: [
                        CupertinoListTile(
                          title: Text(
                            'Deactivate this Patient',
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
                  ],
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const Center(child: CupertinoActivityIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
    );
  }
}
