import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuestionIndicator extends StatelessWidget {
  const QuestionIndicator({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      width: 346,
      child: Stack(
        children: [
          Container(
            height: 23,
            width: 346,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(23),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _Indicator(index >= 0, index == 0),
              _Indicator(index >= 1, index == 1),
              _Indicator(index >= 2, index == 2),
              _Indicator(index >= 3, index == 3),
              _Indicator(index >= 4, index == 4),
              _Indicator(index >= 5, index == 5),
              _Indicator(index >= 6, index == 6),
              _Indicator(index >= 7, index == 7),
              _Indicator(index >= 8, index == 8),
              _Indicator(index >= 9, index == 9),
              _Indicator(index >= 10, index == 10),
              _Indicator(index >= 11, index == 11),
              _Indicator(index >= 12, index == 12),
              _Indicator(index >= 13, index == 13),
              _Indicator(index >= 14, index == 14),
              _Indicator(index >= 15, index == 15),
              _Indicator(index >= 16, index == 16),
              _Indicator(index >= 17, index == 17),
              _Indicator(index >= 18, index == 18),
              _Indicator(index >= 19, index == 19),
            ],
          ),
        ],
      ),
    );
  }
}

class _Indicator extends StatelessWidget {
  const _Indicator(this.active, this.triangle);

  final bool active;
  final bool triangle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 3),
        Container(
          height: 17,
          width: 17,
          decoration: BoxDecoration(
            color: active ? Colors.black : Colors.black.withOpacity(0.32),
            shape: BoxShape.circle,
          ),
        ),
        if (triangle) ...[
          const SizedBox(height: 12),
          SvgPicture.asset('assets/triangle.svg'),
        ],
      ],
    );
  }
}
