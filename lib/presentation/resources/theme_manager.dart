

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_manager.dart';
import 'style_manager.dart';
import 'values_manager.dart';


class ThemeManager{
  ThemeData themeData(){
    return ThemeData(
      drawerTheme: DrawerThemeData(
        elevation: 1.0,
        backgroundColor: Colors.grey[100],
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: ColorManager.white,
        iconTheme: IconThemeData(
          color: ColorManager.grey
        ),
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: ColorManager.white,
        ),

      ),
      scaffoldBackgroundColor: ColorManager.white,
      textTheme: TextTheme(
        titleLarge: getBoldStyle(color: ColorManager.primary,fontSize: AppSize.s28),
        titleMedium: getBoldStyle(color: ColorManager.primary,fontSize: AppSize.s20),
        titleSmall: getRegularStyle(color: ColorManager.grey,fontSize: AppSize.s18),
        displayMedium: getBoldStyle(color: ColorManager.grey , fontSize: AppSize.s24),
        displaySmall: getRegularStyle(color: ColorManager.white , fontSize: AppSize.s24),
        headlineSmall: getBoldStyle(
            color: ColorManager.white ,
            fontSize: AppSize.s28,
            shadow: [
              Shadow(
                color: ColorManager.primary,
                offset: Offset(4, 4),
                blurRadius: 10.0
              ),
            ],
        ),
      ),

    );
  }
}