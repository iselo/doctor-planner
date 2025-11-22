import 'package:doctor_planer/patients/add_patient_sheet.dart';
import 'package:doctor_planer/patients/view_patient_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/app_database.dart';
import '../data/database_provider.dart';

final class PatientTabView extends ConsumerWidget {
  const PatientTabView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final patientService = ref.watch(
      DatabaseProvider.instance().patientServiceProvider(),
    );
    final thickness = 1 / MediaQuery.of(context).devicePixelRatio;
    return CupertinoPageScaffold(
      child: SafeArea(
        top: false,
        bottom: true,
        child: StreamBuilder<List<Patient>>(
          stream: patientService.watchAll(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CupertinoActivityIndicator());
            }
            final patients = snapshot.data!;
            return CustomScrollView(
              physics: const BouncingScrollPhysics(
                parent: ClampingScrollPhysics(),
              ),
              slivers: <Widget>[
                CupertinoSliverNavigationBar.search(
                  enableBackgroundFilterBlur: true,
                  bottomMode: NavigationBarBottomMode.always,
                  stretch: true,
                  largeTitle: const Text('Patients'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: const Icon(
                          CupertinoIcons.line_horizontal_3_decrease,
                        ),
                        onPressed: () {},
                      ),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: const Icon(CupertinoIcons.add),
                        onPressed: () {
                          showCupertinoSheet<void>(
                            context: context,
                            useNestedNavigation: true,
                            builder: (BuildContext context) =>
                                AddPatientSheet(),
                          );
                        },
                      ),
                    ],
                  ),
                  onSearchableBottomTap: _onSearchableBottomTap,
                  searchField: CupertinoSearchTextField(
                    placeholder: 'Search',
                    onChanged: (String value) {},
                    onSubmitted: (String value) {},
                  ),
                ),

                /// Patients list
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final patient = patients[index];

                    return Column(
                      children: <Widget>[
                        CupertinoListTile(
                          title: RichText(
                            text: TextSpan(
                              style: CupertinoTheme.of(
                                context,
                              ).textTheme.textStyle,
                              children: [
                                TextSpan(text: '${patient.firstName} '),
                                TextSpan(
                                  text: patient.lastName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              CupertinoPageRoute(
                                builder: (context) => const ViewPatientPage(),
                              ),
                            );
                          },
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                            height: thickness,
                            color: Color(0x4A3C3C43),
                          ),
                        ),
                      ],
                    );
                  }, childCount: patients.length),
                ),

                /// Footer
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          '${patients.length} Patients',
                          style: CupertinoTheme.of(context).textTheme.textStyle
                              .copyWith(
                                color: CupertinoColors.secondaryLabel,
                                fontSize: 20,
                              ),
                        ),
                        const SizedBox(height: 40.0),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _onSearchableBottomTap(bool value) {}
}
