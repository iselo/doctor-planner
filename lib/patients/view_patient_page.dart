import 'package:doctor_planer/l10n/l10n_date_ext.dart';
import 'package:doctor_planer/patients/widget_optional_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/database_provider.dart';
import '../l10n/app_localizations.dart';

class ViewPatientPage extends ConsumerWidget {
  final String _patientId;

  const ViewPatientPage({super.key, required String patientId})
    : _patientId = patientId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10nText = AppLocalizations.of(context)!;
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
                  previousPageTitle: l10nText.patients,
                  trailing: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: Text(l10nText.edit),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    CupertinoListSection.insetGrouped(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      children: [
                        CupertinoListTile(
                          padding: EdgeInsets.all(16),
                          title: Text(l10nText.phoneNumber.toLowerCase()),
                          subtitle: Text(
                            patient.phoneNumber!,
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .textStyle
                                .copyWith(color: CupertinoColors.link),
                          ),
                        ),
                      ],
                    ).visibleIf(patient.phoneNumber!.isNotEmpty),

                    CupertinoListSection.insetGrouped(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      children: [
                        CupertinoListTile(
                          padding: EdgeInsets.all(16),
                          title: Text(l10nText.birthday),
                          subtitle: Text(
                            patient.birthday!.toL10n(context),
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .textStyle
                                .copyWith(color: CupertinoColors.link),
                          ),
                        ),
                      ],
                    ).visibleIf(patient.birthday != null),

                    CupertinoListSection.insetGrouped(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      children: [
                        CupertinoListTile(
                          title: Text(
                            patient.isActive
                                ? l10nText.deactivateThisPatient
                                : l10nText.activateThisPatient,
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
      error: (err, stack) => Center(child: Text('${l10nText.error}: $err')),
    );
  }
}
