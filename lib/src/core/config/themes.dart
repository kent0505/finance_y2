import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

final theme = ThemeData(
  useMaterial3: false,
  primarySwatch: Colors.grey,
  fontFamily: Fonts.regular,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.main,
    selectionColor: AppColors.main,
    selectionHandleColor: AppColors.main,
  ),
  colorScheme: ColorScheme.fromSwatch(
    accentColor: AppColors.main,
  ),
  dialogTheme: const DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  ),
);

const cupertinoTheme = CupertinoThemeData(
  textTheme: CupertinoTextThemeData(
    textStyle: TextStyle(
      fontFamily: Fonts.regular,
      color: Colors.black,
    ),
    dateTimePickerTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontFamily: Fonts.medium,
    ),
  ),
);
