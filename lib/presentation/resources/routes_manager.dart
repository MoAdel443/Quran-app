
import 'package:flutter/material.dart';
import 'package:quran_app/presentation/home/home_screen.dart';
import 'package:quran_app/presentation/sebha/sebha_screen.dart';
import 'package:quran_app/presentation/surah/quran_surah_Screen.dart';
import 'package:quran_app/presentation/resources/strings_manager.dart';
import 'package:quran_app/presentation/splash/splash_screen.dart';

import '../surah/surah_screen.dart';

class Routes{
  static const String splashRoute = '/';
  static const String home = '/home';
  static const String surah = '/surah';
  static const String quranSurah = '/quranSurah';
  static const String bookmark = '/bookmark';
}

class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) =>  HomeScreen());
      case Routes.surah:
        return MaterialPageRoute(builder: (_) =>  SurahScreen());
      case Routes.quranSurah:
        return MaterialPageRoute(builder: (_) => QuranSurahScreen());
      case Routes.bookmark:
        return MaterialPageRoute(builder: (_) => const SebhaScreen());
      default :
        return unDefinedRoute();
    }
  }
  static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(builder: (_) => Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.unDefinedRoute),
      ),
      body: const Center(
        child: Text(AppStrings.unDefinedRoute),
      ),
    ));
  }
}