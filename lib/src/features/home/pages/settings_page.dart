import 'package:flutter/material.dart';

import '../../../core/utils.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/widgets/others/svg_widget.dart';
import '../../../core/widgets/texts/text_widget.dart';
import '../../../core/widgets/buttons/cuper_button.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12 + getStatusBar(context)),
        const Center(
          child: TextWidget(
            'Settings',
            fontSize: 22,
            fontFamily: Fonts.bold,
            color: Colors.black,
          ),
        ),
        const Spacer(),
        _Button(
          id: 1,
          title: 'Support page',
          onPressed: () {},
        ),
        const SizedBox(height: 16),
        _Button(
          id: 2,
          title: 'Share with friends',
          onPressed: () {},
        ),
        const SizedBox(height: 16),
        _Button(
          id: 3,
          title: 'Terms of use',
          onPressed: () {},
        ),
        const SizedBox(height: 16),
        _Button(
          id: 4,
          title: 'Subscription info',
          onPressed: () {},
        ),
        const SizedBox(height: 16),
        _Button(
          id: 5,
          title: 'Privacy Policy',
          onPressed: () {},
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.id,
    required this.title,
    required this.onPressed,
  });

  final int id;
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(45),
        border: Border.all(
          width: 1,
          color: Colors.black,
        ),
      ),
      child: CuperButton(
        onPressed: onPressed,
        child: Row(
          children: [
            SizedBox(
              width: 54,
              child: Center(
                child: SvgWidget('assets/settings$id.svg'),
              ),
            ),
            TextWidget(
              title,
              fontSize: 16,
              fontFamily: Fonts.regular,
              color: const Color(0xff454545),
            ),
          ],
        ),
      ),
    );
  }
}
