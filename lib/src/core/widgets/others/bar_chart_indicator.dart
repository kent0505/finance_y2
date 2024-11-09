import 'package:flutter/material.dart';

class BarChartIndicator extends StatelessWidget {
  const BarChartIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 21,
      width: 21,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.12),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Container(
          height: 13,
          width: 13,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
