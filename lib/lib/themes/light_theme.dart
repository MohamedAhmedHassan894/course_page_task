import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_palette.dart';
import '../utils/dimensions.dart';
import '../utils/styles.dart';
ThemeData lightTheme = ThemeData(
  fontFamily: 'Montserrat',
  scaffoldBackgroundColor: AppPalette.backgroundColor, //done
  appBarTheme: AppBarTheme(
    backgroundColor: AppPalette.backgroundColor,
    centerTitle: true,
    elevation: 0,
    iconTheme: const IconThemeData(
      color: AppPalette.buttonColorWeight,
    ),
    actionsIconTheme: const IconThemeData(
      color: AppPalette.buttonColorWeight,
    ),
    titleTextStyle: AppTextStyles.montserratBold.copyWith(
      fontSize: Dimensions.fontSizeExtraLarge,
    ),
    systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark),
  ),
  disabledColor: const Color(0xFFBABFC4),
  backgroundColor: AppPalette.backgroundColor,
  brightness: Brightness.light,
  hintColor: const Color(0xFF6D6D6D),
  iconTheme: const IconThemeData(color: Colors.white),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: AppPalette.backgroundColor,
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeExtraExtraLarge,
              vertical: Dimensions.paddingSizeSmall),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
          ),
          textStyle: AppTextStyles.montserratRegular.copyWith(
              fontSize: Dimensions.fontSizeLarge, color: Colors.white))), //done
);
