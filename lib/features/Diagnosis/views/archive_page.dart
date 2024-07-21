import 'package:apocalypsea2sv/config/ui_colors.dart';
import 'package:apocalypsea2sv/features/Diagnosis/components/custom_container.dart';
import 'package:apocalypsea2sv/features/Diagnosis/components/custom_clickable_container.dart';
import 'package:apocalypsea2sv/features/Diagnosis/views/tips_pages_wrapper.dart';
import 'package:flutter/material.dart';

class ArchivePage extends StatefulWidget {
  const ArchivePage({super.key});

  @override
  State<ArchivePage> createState() => _ArchivePageState();
}

class _ArchivePageState extends State<ArchivePage> {
  //same function on the previous screen, navigate to previous screen
  void _navigateToDailyTips(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DailyTipsPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Archive Page'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          children: [
            CustomClickableContainer(
                leftIconPath: "assets/icons/arrow_left.svg",
                title: "Tips Archive",
                rightIconPath: "assets/icons/archive.svg",
                iconColor: AppColors.mainDark,
                onTap: () => _navigateToDailyTips(
                    context)), //we calling the function of navigation here
            const CustomContainer(
                title: "20 jul 2024",
                titleColor: AppColors.main,
                content:
                    "Stay Hydrated: Drink plenty of water throughout the day to keep your skin hydrated and help flush out toxins."),
            const CustomContainer(
                title: "20 jul 2024",
                titleColor: AppColors.main,
                content:
                    "Use Sunscreen Daily: Protect your skin from harmful UV rays by applying sunscreen with at least SPF 30, even on cloudy days."),
            const CustomContainer(
                title: "20 jul 2024",
                titleColor: AppColors.main,
                content:
                    "Moisturize Regularly: Choose a moisturizer suitable for your skin type and apply it daily to maintain skin elasticity and prevent dryness."),
            const CustomContainer(
                title: "20 jul 2024",
                titleColor: AppColors.main,
                content:
                    "at a Balanced Diet: Include plenty of fruits, vegetables, lean proteins, and healthy fats in your diet to provide essential nutrients for skin health.")
          ],
        ),
      ),
      //the nabvar is causing a routing problem
      //bottomNavigationBar: BottomNavBar(),
    );
  }
}
