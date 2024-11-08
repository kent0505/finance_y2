import 'package:flutter/material.dart';

import '../texts/text_widget.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: TextWidget(
        'No data',
        fontSize: 14,
      ),
    );
  }
}
