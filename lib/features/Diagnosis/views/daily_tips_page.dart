import 'package:apocalypsea2sv/config/ui_colors.dart';
import 'package:apocalypsea2sv/features/Diagnosis/components/custom_container.dart';
import 'package:apocalypsea2sv/features/feed/components/health_tip.dart';
import 'package:apocalypsea2sv/services/tips.dart';
import 'package:flutter/material.dart';

class DailyTipsContent extends StatefulWidget {
  const DailyTipsContent({super.key});

  @override
  _DailyTipsContentState createState() => _DailyTipsContentState();
}

class _DailyTipsContentState extends State<DailyTipsContent> {
  late Future<Map<String, dynamic>> _dailyTip;

  @override
  void initState() {
    super.initState();
    _dailyTip = TipService().fetchDailyTip();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: _dailyTip,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          return SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 2.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: HealthTip(
                    dailyTip: snapshot.data?["tip"],
                    color: AppColors.white,
                  ),
                ),
                CustomContainer(
                  title: "Details",
                  content: snapshot.data?["tip_detailed"],
                  // "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  backgroundColor: AppColors.white,
                  showIcon: true,
                  iconPath: "assets/icons/ai.svg",
                  iconColor: AppColors.main,
                ),
              ],
            ),
          );
        } else {
          return const Center(child: Text('No data available'));
        }
      },
    );
  }
}
