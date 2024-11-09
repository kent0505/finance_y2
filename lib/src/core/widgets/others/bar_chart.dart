import 'package:flutter/material.dart';

import '../../config/app_colors.dart';
import '../texts/text_widget.dart';
import 'svg_widget.dart';

class BarChart extends StatelessWidget {
  const BarChart({
    super.key,
    required this.month,
    required this.height,
  });

  final String month;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 7),
          child: SvgWidget('assets/line.svg'),
        ),
        Column(
          children: [
            const SizedBox(height: 3),
            _Bar(height: height),
            const SizedBox(height: 24),
            TextWidget(
              month,
              fontSize: 12,
              fontFamily: Fonts.bold,
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(left: 7),
          child: SvgWidget('assets/line.svg'),
        ),
      ],
    );
  }
}

class _Bar extends StatelessWidget {
  const _Bar({required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: 71,
      child: Container(
        width: 20,
        height: height + 1,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(4),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Stack(
            children: [
              SizedBox(
                height: 1000,
                width: 1000,
                child: Column(
                  children: [
                    const _Line(top: 1),
                    ...List.generate(
                      (height / 2).toInt() - 1,
                      (index) {
                        return const _Line();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Line extends StatelessWidget {
  const _Line({this.top = 0});

  final double top;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: 20,
      color: Colors.white,
      margin: EdgeInsets.only(
        top: top,
        bottom: 1,
      ),
    );
  }
}
