import 'package:test_case/constants/colors.dart';
import 'package:test_case/constants/font_sizes.dart';
import 'package:test_case/constants/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/system_ui_overlay_styles.dart';

final theme = ThemeData(
  colorScheme: _colorScheme,
  scaffoldBackgroundColor: AppColors.background,
  // outlinedButtonTheme: _outLinedButtonThemeData,
  filledButtonTheme: _filledButtomThemeData,
  // datePickerTheme: _datePickerThemeData,
  floatingActionButtonTheme: _floatingActionButtonThemeData,
  cupertinoOverrideTheme: _cupertinoThemeData,
  inputDecorationTheme: _inputDecorationTheme,
  // bottomSheetTheme: _bottomSheetThemeData,
  primaryColorLight: AppColors.brandColor,
  textButtonTheme: _textButtonThemeData,
  iconButtonTheme: _iconButtonThemeData,
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: AppColors.white,
    selectionColor: AppColors.white.withAlpha(50),
    selectionHandleColor: AppColors.white,
  ),
  dialogTheme: _dialogTheme,
  primaryColor: AppColors.brandColor,

  primaryTextTheme: _textTheme,
  popupMenuTheme: _popupMenuThemeData,
  dividerTheme: _dividerThemeData,
  dividerColor: AppColors.background.withAlpha(25),
  drawerTheme: _drawerThemeData,
  appBarTheme: _appBarTheme,
  textTheme: _textTheme,

  useMaterial3: true,
);

final _colorScheme = ColorScheme.dark(
  primary: AppColors.brandColor,
  onPrimary: AppColors.white,
  onSecondary: AppColors.background,
  secondary: AppColors.white,
);

final _filledButtomThemeData = FilledButtonThemeData(
  style: ButtonStyle(
    minimumSize: WidgetStatePropertyAll(Size.fromHeight(60.r)),
    backgroundColor: WidgetStateProperty.resolveWith<Color>(
      (states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.white.withAlpha(50);
        } else {
          return AppColors.brandColor;
        }
      },
    ),
    side: const WidgetStatePropertyAll(BorderSide.none),
    padding: WidgetStatePropertyAll(
        EdgeInsets.only(top: 17.r, bottom: 17.r, left: 20.r, right: 20.r)),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.r)),
    ),
    textStyle:
        WidgetStatePropertyAll(displayLarge.copyWith(color: AppColors.white)),
    foregroundColor: const WidgetStatePropertyAll(AppColors.white),
    elevation: const WidgetStatePropertyAll(0),
  ),
);

final _popupMenuThemeData = PopupMenuThemeData(
  color: AppColors.background,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
  elevation: 0,
  textStyle: titleMedium,
);

final _floatingActionButtonThemeData = FloatingActionButtonThemeData(
  backgroundColor: AppColors.brandColor,
  foregroundColor: AppColors.background,
  elevation: 0,
  focusElevation: 0,
  hoverElevation: 0,
  extendedIconLabelSpacing: 0,
  highlightElevation: 0,
  disabledElevation: 0,
  extendedPadding: EdgeInsets.zero,
  sizeConstraints: BoxConstraints.tightFor(width: 60.r, height: 60.r),
  extendedSizeConstraints: BoxConstraints.tightFor(width: 60.r, height: 60.r),
  smallSizeConstraints: BoxConstraints.tightFor(width: 60.r, height: 60.r),
  largeSizeConstraints: BoxConstraints.tightFor(width: 60.r, height: 60.r),
  iconSize: 36.r,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(100.r),
    ),
  ),
);

const _cupertinoThemeData = CupertinoThemeData(
  primaryColor: AppColors.brandColor,
  applyThemeToAll: true,
  scaffoldBackgroundColor: AppColors.background,
  barBackgroundColor: AppColors.white,
  brightness: Brightness.light,
);

final _inputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: AppColors.white.withAlpha(25),
  iconColor: AppColors.white,
  suffixIconColor: AppColors.white,
  prefixIconColor: AppColors.white,
  hintStyle: labelSmall.copyWith(color: AppColors.white.withAlpha(125)),
  labelStyle: labelSmall.copyWith(color: AppColors.background.withAlpha(125)),
  errorStyle: labelSmall.copyWith(color: AppColors.error),
  errorMaxLines: 2,
  floatingLabelStyle:
      labelSmall.copyWith(color: AppColors.background.withAlpha(125)),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(18.r),
    borderSide: BorderSide(
      color: AppColors.white.withAlpha(50),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(18.r),
    borderSide: BorderSide(
      color: AppColors.white.withAlpha(50),
    ),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(18.r),
    borderSide: BorderSide(
      color: AppColors.white.withAlpha(50),
    ),
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(18.r),
    borderSide: BorderSide(
      color: AppColors.white.withAlpha(25),
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(18.r),
    borderSide: BorderSide(
      color: AppColors.brandColor.withAlpha(50),
    ),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(18.r),
    borderSide: BorderSide(
      color: AppColors.white.withAlpha(50),
    ),
  ),
);

final _textButtonThemeData = TextButtonThemeData(
  style: ButtonStyle(
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    foregroundColor: const WidgetStatePropertyAll(AppColors.white),
    backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
    overlayColor: const WidgetStatePropertyAll(Colors.transparent),
    padding: const WidgetStatePropertyAll(EdgeInsets.zero),
    textStyle:
        WidgetStatePropertyAll(labelSmall.copyWith(fontSize: fontSize14)),
  ),
);

final _iconButtonThemeData = IconButtonThemeData(style: _iconButtonStyle);

final _iconButtonStyle = ButtonStyle(
  foregroundColor: const WidgetStatePropertyAll(AppColors.brandColor),
  backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
  iconColor: const WidgetStatePropertyAll(AppColors.brandColor),
  padding: WidgetStatePropertyAll(EdgeInsets.all(10.r)),
  shape: const WidgetStatePropertyAll(CircleBorder()),
);

final _dialogTheme = DialogTheme(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
  contentTextStyle: displaySmall,
  titleTextStyle: titleMedium,
  backgroundColor: AppColors.background,
  elevation: 0,
);

final _dividerThemeData = DividerThemeData(
  color: AppColors.background.withAlpha(25),
  thickness: 1.r,
  space: 0,
);

const _drawerThemeData = DrawerThemeData(
  backgroundColor: AppColors.background,
  elevation: 0,
);

final _appBarTheme = AppBarTheme(
  iconTheme: _iconThemeData,
  systemOverlayStyle: systemUiOverlayDarkStyle,
  actionsIconTheme: _iconThemeData,
  titleTextStyle: titleMedium,
  foregroundColor: AppColors.background,
  scrolledUnderElevation: 0,
  elevation: 0,
  centerTitle: true,
  backgroundColor: Colors.transparent,
);

final _iconThemeData = IconThemeData(
  color: AppColors.brandColor,
  size: 72,
);

final _textTheme = TextTheme(
  titleSmall: titleSmall,
  titleMedium: titleMedium,
  titleLarge: titleLarge,
  labelSmall: labelSmall,
  labelMedium: labelMedium,
  displaySmall: displaySmall,
  displayMedium: displayMedium,
  displayLarge: displayLarge,
);
