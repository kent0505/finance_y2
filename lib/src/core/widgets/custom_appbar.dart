import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../config/app_colors.dart';
import '../utils.dart';
import 'buttons/cuper_button.dart';
import 'others/svg_widget.dart';
import 'texts/text_widget.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: getStatusBar(context)),
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            CuperButton(
              onPressed: () {
                context.pop();
              },
              minSize: 50,
              child: const SizedBox(
                width: 50,
                child: SvgWidget('assets/back.svg'),
              ),
            ),
            const Spacer(),
            const TextWidget(
              'New Transfer',
              fontSize: 22,
              fontFamily: Fonts.bold,
              color: Colors.black,
            ),
            const Spacer(),
            const SizedBox(width: 50),
          ],
        ),
      ),
    );
  }
}
