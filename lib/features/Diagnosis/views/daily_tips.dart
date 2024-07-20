import 'package:apocalypsea2sv/config/ui_colors.dart';
import 'package:apocalypsea2sv/features/Diagnosis/components/custom_container.dart';
import 'package:apocalypsea2sv/features/Diagnosis/components/custom_clickable_container.dart';
import 'package:apocalypsea2sv/features/Diagnosis/components/top_nav_bar.dart';
import 'package:apocalypsea2sv/features/Diagnosis/views/archive_page.dart';
import 'package:apocalypsea2sv/features/Diagnosis/views/more_tips.dart';
import 'package:apocalypsea2sv/features/Diagnosis/views/symptoms_diagnosis.dart';
import 'package:apocalypsea2sv/features/feed/components/health_tip.dart';
import 'package:flutter/material.dart';

class DailyTipsPage extends StatefulWidget {
  const DailyTipsPage({super.key});

  @override
  State<DailyTipsPage> createState() => _DailyTipsPageState();
}

class _DailyTipsPageState extends State<DailyTipsPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    DailyTipsContent(), // Page 0
    MoreTipsPage(), // Page 1
    SymptomsDiagnosisPage(), // Page 2
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
        builder: (context) => ArchivePage(),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
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

class DailyTipsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: HealthTip(
              dailyTip:
                  "For strong bones: Include calcium-rich foods like dairy products, leafy greens, and tofu in your diet. Consider taking a vitamin D supplement if needed.",
              color: AppColors.white,
            ),
          ),
          CustomContainer(
            title: "Details",
            content:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            backgroundColor: AppColors.white,
            showIcon: true,
            iconPath: "assets/icons/ai.svg",
            iconColor: AppColors.main,
          ),
        ],
      ),
    );
  }
}
