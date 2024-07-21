import 'package:apocalypsea2sv/config/ui_colors.dart';
import 'package:apocalypsea2sv/features/Diagnosis/components/custom_container.dart';
import 'package:flutter/material.dart';

class MoreTipsPage extends StatefulWidget {
  const MoreTipsPage({super.key});

  @override
  State<MoreTipsPage> createState() => _MoreTipsPageState();
}

class _MoreTipsPageState extends State<MoreTipsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomContainer(title: "More Tips for your Health", content: "Stay Hydrated: Drink plenty of water throughout the day to keep your skin hydrated and help flush out toxins. Use Sunscreen Daily: Protect your skin from harmful UV rays by applying sunscreen with at least SPF 30, even on cloudy days. Moisturize Regularly: Choose a moisturizer suitable for your skin type and apply it daily to maintain skin elasticity and prevent dryness. Eat a Balanced Diet: Include plenty of fruits, vegetables, lean proteins, and healthy fats in your diet to provide essential nutrients for skin health.",
          backgroundColor: AppColors.white, showIcon: true, iconPath: "assets/icons/ai.svg", iconColor: AppColors.main,),
        ],
      ),
    );
  }
}

