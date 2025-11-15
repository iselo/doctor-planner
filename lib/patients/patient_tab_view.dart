import 'package:doctor_planer/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final class PatientTabView extends StatelessWidget {
  const PatientTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        top: false,
        bottom: true,
        child: CustomScrollView(
          physics: BouncingScrollPhysics(parent: ClampingScrollPhysics()),
          slivers: [
            CupertinoSliverNavigationBar.search(
              bottomMode: NavigationBarBottomMode.always,
              // backgroundColor: CupertinoColors.white.withAlpha(10),
              stretch: true,
              largeTitle: const Text('Patients'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Icon(CupertinoIcons.line_horizontal_3_decrease),
                    onPressed: () {},
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Icon(CupertinoIcons.add),
                    onPressed: () {},
                  ),
                ],
              ),
              onSearchableBottomTap: _onSearchableBottomTap,
              searchField: CupertinoSearchTextField(
                autofocus: true,
                placeholder: 'Search',
                onChanged: (String value) {},
                onSubmitted: (String value) {},
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final patient = patients[index];
                final primaryColor = CupertinoTheme.of(context).primaryContrastingColor;
                return Column(
                  children: [
                    CupertinoListTile(
                        title:
                        RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 17.0),
                            children: [
                              TextSpan(text: '${patient.firstName} '),
                              TextSpan(text: patient.firstName, style: TextStyle(fontWeight: FontWeight.bold)),
                            ]
                          ),
                        )
                    ),
                    const Divider(
                      height: 0.5,
                      thickness: 0.5,
                      indent: 16,
                      endIndent: 16,
                    ),
                  ],
                );
              }, childCount: patients.length),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      '179 Patients',
                      style: TextStyle(
                        color: CupertinoColors.secondaryLabel,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 40.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSearchableBottomTap(bool value) {}
}
