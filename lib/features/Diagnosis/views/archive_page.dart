import 'package:apocalypsea2sv/config/ui_colors.dart';
import 'package:apocalypsea2sv/features/Diagnosis/components/custom_container.dart';
import 'package:apocalypsea2sv/features/Diagnosis/components/custom_clickable_container.dart';
import 'package:apocalypsea2sv/features/Diagnosis/views/daily_tips.dart';
import 'package:apocalypsea2sv/features/Diagnosis/views/more_tips.dart';
import 'package:apocalypsea2sv/features/Diagnosis/views/profile.dart';
import 'package:apocalypsea2sv/features/Diagnosis/views/symptoms_diagnosis.dart';
import 'package:apocalypsea2sv/features/feed/components/navbar.dart';
import 'package:apocalypsea2sv/features/feed/views/home_page.dart';
import 'package:flutter/material.dart';

class ArchivePage extends StatefulWidget {
  const ArchivePage({Key? key}) : super(key: key);

  @override
  State<ArchivePage> createState() => _ArchivePageState();
}

class _ArchivePageState extends State<ArchivePage> {

  
  //same function on the previous screen, navigate to previous screen
  void _navigateToDailyTips(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DailyTipsPage()),
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
            CustomContainer(
                title: "20 jul 2024",
                titleColor: AppColors.main,
                content:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard "),
            CustomContainer(
                title: "20 jul 2024",
                titleColor: AppColors.main,
                content:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard "),
            CustomContainer(
                title: "20 jul 2024",
                titleColor: AppColors.main,
                content:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard "),
                    CustomContainer(
                title: "20 jul 2024",
                titleColor: AppColors.main,
                content:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard ")
          ],
        ),
      ),
      //the nabvar is causing a routing problem
      //bottomNavigationBar: BottomNavBar(),
    );
  }
}
