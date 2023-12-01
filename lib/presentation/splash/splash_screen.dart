
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_app/presentation/home/home_screen.dart';
import 'package:quran_app/presentation/resources/color_manager.dart';
import 'package:quran_app/presentation/resources/font_manager.dart';
import 'package:quran_app/presentation/resources/strings_manager.dart';
import 'package:quran_app/presentation/resources/values_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  List<dynamic> data = [] ;
  List<dynamic> doaa = [] ;
  Map<String, dynamic> ayahs = {};



  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadJson();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadayahsJson();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loaddoaaJson();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Text(
              AppStrings.splashTitle,
              style: TextStyle(
                fontSize: FontSize.s50,
                fontFamily: FontConstant.fontFamily,
                fontWeight: FontWeight.bold,
                color: ColorManager.primary,
                shadows: [
                  Shadow(
                    color: ColorManager.primaryLight2,
                    blurRadius: AppSize.s40,
                    offset: const Offset(AppSize.s2, AppSize.s2),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: AppPadding.p8, bottom: AppPadding.p50),
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                AppStrings.splashSubTitle,
                style: TextStyle(
                  fontSize: FontSize.s24,
                  fontFamily: FontConstant.fontFamily,
                  fontWeight: FontWeight.w300,
                  color: ColorManager.grey,
                ),
              ),
            ),
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: double.infinity,
                height: AppSize.s500,
                color: ColorManager.white,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: AppPadding.p30),
                child: Center(child: Image.asset('assets/images/splash.png')),
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(
                            data: data,
                            ayahs: ayahs,
                            doaa: doaa,

                          ),
                        ));
                  },
                  child: Container(
                    height: AppSize.s60,
                    width: AppSize.s150,
                    decoration: ShapeDecoration(
                        color: ColorManager.orangeLight,
                        shape: StadiumBorder(
                            side: BorderSide(color: ColorManager.orangeLight))),
                    alignment: Alignment.center,
                    child: Text(
                      AppStrings.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: FontConstant.fontFamily,
                        fontSize: FontSize.s35,
                        color: ColorManager.white,
                        shadows: [
                          Shadow(
                              color: ColorManager.black,
                              blurRadius: AppSize.s10,
                              offset: const Offset(AppSize.s0, AppSize.s2))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  loadJson() async {
    String Data = await rootBundle.loadString('assets/json/quran.json');
    data = json.decode(Data);
    print(data);
  }
  loadayahsJson() async {
    String Data = await rootBundle.loadString('assets/json/ayahs.json');
    ayahs = json.decode(Data);
    print(ayahs);
  }
  loaddoaaJson() async {
    String Data = await rootBundle.loadString('assets/json/adhkar.json');
    doaa = json.decode(Data);
    print(doaa);
  }

}
