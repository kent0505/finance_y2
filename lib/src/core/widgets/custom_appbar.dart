import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils.dart';
import '../config/app_colors.dart';
import 'buttons/cuper_button.dart';
import 'others/svg_widget.dart';
import 'texts/text_widget.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar(
    this.title, {
    super.key,
    this.onDelete,
  });

  final String title;
  final void Function()? onDelete;

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
            TextWidget(
              title,
              fontSize: 22,
              fontFamily: Fonts.bold,
              color: Colors.black,
            ),
            const Spacer(),
            SizedBox(
              width: 50,
              child: onDelete != null
                  ? CuperButton(
                      onPressed: onDelete,
                      minSize: 50,
                      child: const Icon(
                        Icons.delete,
                        color: Colors.black,
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
