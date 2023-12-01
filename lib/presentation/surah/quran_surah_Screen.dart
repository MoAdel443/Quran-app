import 'package:flutter/material.dart';
import 'package:quran_app/presentation/resources/color_manager.dart';
import 'package:quran_app/presentation/resources/font_manager.dart';

import '../resources/strings_manager.dart';


// ignore: must_be_immutable
class QuranSurahScreen extends StatefulWidget {
  Map data = {};
  Map<String, dynamic> ayahs = {};
  QuranSurahScreen({super.key, this.data = const {}, this.ayahs = const {}});

  @override
  State<QuranSurahScreen> createState() => _QuranSurahScreenState();
}

class _QuranSurahScreenState extends State<QuranSurahScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.data["name_translation"],
          style: TextStyle(
              fontSize: 24,
              // fontFamily: FontConstant.fontFamily,
              fontWeight: FontWeight.w800,
              color: ColorManager.primary),
        ),
        actions: const [Image(image: AssetImage("assets/images/search.png"))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 265.0,
                    decoration: BoxDecoration(
                      color: ColorManager.primaryLight2.withOpacity(.95),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Image.asset('assets/images/shadow1.png'),
                  ),
                  const Padding(
                    padding: const EdgeInsets.only(top: 70.0),
                    child: Center(
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Opacity(
                            opacity: .8,
                            child: Image(
                              image: AssetImage(
                                  "assets/images/QuranbackGround.png"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Center(
                      child: Text(
                        widget.ayahs['name'],
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 30.0,
                            color: ColorManager.white,
                            shadows: [
                              Shadow(
                                  color: ColorManager.black,
                                  offset: Offset(2, 2),
                                  blurRadius: 10.0)
                            ]),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 70.0),
                    child: Center(
                      child: Text(
                        widget.data["name_translation"],
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 26.0,
                            color: ColorManager.white,
                            shadows: [
                              Shadow(
                                  color: ColorManager.black,
                                  offset: Offset(2, 2),
                                  blurRadius: 10.0)
                            ]),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 120.0),
                      child: Center(
                          child: Image.asset("assets/images/Divider.png"))),
                  Padding(
                    padding: const EdgeInsets.only(top: 130),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.ayahs["numberOfAyahs"].toString(),
                          style: TextStyle(
                              fontSize: 22.0,
                              fontFamily: FontConstant.fontFamily,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.white),
                        ),
                        Text(
                          ": " + AppStrings.ayahNums,
                          style: TextStyle(
                              fontSize: 22.0,
                              fontFamily: FontConstant.fontFamily,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.white),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 180),
                    child: Center(
                      child: Image.asset("assets/images/albsmalh.png"),
                    ),
                  ),
                ],
              ),

              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget.data['ar'],
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: FontConstant.fontFamily,
                                    color: ColorManager.black,
                                    shadows: [
                                      Shadow(
                                          color: ColorManager.primary.withOpacity(.25),
                                          offset: Offset(2,2),
                                          blurRadius: 20.0
                                      )
                                    ]
                                ),),
                            ),
                          ],
                        ),
                      ),
                  separatorBuilder: (context, index) => Container(
                        width: double.infinity,
                        height: 1.0,

                      ),
                  itemCount:1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
