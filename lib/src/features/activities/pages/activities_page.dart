import 'package:flutter/material.dart';

import '../../../core/utils.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/widgets/texts/text_widget.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12 + getStatusBar(context)),
        const Center(
          child: TextWidget(
            'Activities',
            fontSize: 22,
            fontFamily: Fonts.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        const SizedBox(height: 66), // switch
        const SizedBox(height: 12),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
