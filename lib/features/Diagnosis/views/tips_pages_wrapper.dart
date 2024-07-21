import 'package:apocalypsea2sv/config/ui_colors.dart';
import 'package:apocalypsea2sv/features/Diagnosis/components/custom_clickable_container.dart';
import 'package:apocalypsea2sv/features/Diagnosis/components/top_nav_bar.dart';
import 'package:apocalypsea2sv/features/Diagnosis/views/archive_page.dart';
import 'package:apocalypsea2sv/features/Diagnosis/views/daily_tips_page.dart';
import 'package:apocalypsea2sv/features/Diagnosis/views/more_tips.dart';
import 'package:apocalypsea2sv/features/Diagnosis/views/symptoms_diagnosis.dart';
import 'package:flutter/material.dart';

class DailyTipsPage extends StatefulWidget {
  const DailyTipsPage({super.key});

  @override
  State<DailyTipsPage> createState() => _DailyTipsPageState();
}

class _DailyTipsPageState extends State<DailyTipsPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const DailyTipsContent(), // Page 0
    const MoreTipsPage(), // Page 1
    const SymptomsDiagnosisPage(), // Page 2
  ];

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToArchive(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ArchivePage(),
      ),
    ).then((_) {
      // to handle handle any logic after returning from ArchivePage
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Ask AI about your Health",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
            ),
            // TopNavBar widget
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TopNavBar(
                selectedIndex: _selectedIndex,
                onTabSelected: _onTabSelected,
              ),
            ),
            // Use IndexedStack to maintain state
            // did not work (to remove)
            Expanded(
              child: IndexedStack(
                index: _selectedIndex,
                children: _pages,
              ),
            ),
            // Custom clickable container
            CustomClickableContainer(
              leftIconPath: "assets/icons/archive.svg",
              title: "Tips Archive",
              rightIconPath:
                  "assets/icons/arrow_right.svg", // Custom right icon path
              iconColor: AppColors.mainDark,
              onTap: () => _navigateToArchive(context),
              rowAlignment: MainAxisAlignment.spaceBetween,
            ),
          ],
        ),
      ),
    );
  }
}
