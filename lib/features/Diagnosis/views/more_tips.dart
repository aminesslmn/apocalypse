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
          CustomContainer(title: "More Tips for your Health", content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          backgroundColor: AppColors.white, showIcon: true, iconPath: "assets/icons/ai.svg", iconColor: AppColors.main,),
        ],
      ),
    );
  }
}

