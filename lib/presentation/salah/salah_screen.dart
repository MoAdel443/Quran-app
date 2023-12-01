import 'dart:convert';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/presentation/resources/color_manager.dart';
import 'package:quran_app/presentation/resources/font_manager.dart';
import 'package:http/http.dart'as http;

class SalahScreen extends StatefulWidget {
  const SalahScreen({super.key});

  @override
  State<SalahScreen> createState() => _SalahScreenState();
}

class _SalahScreenState extends State<SalahScreen> {
  Map data ={};
  DateTime time = DateTime.now();
  int index =0;
  @override
  void initState() {
    getPrayDate();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: data.isNotEmpty,
      builder:(context) =>  SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Container(
                  width: double.infinity,
                  height: 118.5,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                            color: ColorManager.primary.withOpacity(.4),
                            blurRadius: 10.0,
                            spreadRadius: 1)
                      ]),
                  child: Stack(
                    children: [
                      Image(
                        image: AssetImage("assets/images/bg.jpg"),
                        fit: BoxFit.fill,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 45.0,left: 20.0),
                        child: Text(
                          data["items"][index]["fajr"],
                          style: TextStyle(
                              color: ColorManager.white,
                              fontSize: 25.0,
                            fontWeight: FontWeight.w700,
                            shadows: [
                              Shadow(
                                color: ColorManager.black,
                                blurRadius: 10.0
                              )
                            ]
                          ),
                        ),
                      ),
                      Center(
                          child: Image(
                            image: AssetImage("assets/images/prayTime/fajr.png"),
                            height: 40,
                            width: 40.0,
                            color: ColorManager.white,
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:30.0,left: 280.0),
                        child: Text(
                          "الفجر",
                          textDirection: TextDirection.rtl,

                          style: TextStyle(
                              color: ColorManager.white,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w700,
                              fontFamily: FontConstant.fontFamily,
                              shadows: [
                                Shadow(
                                    color: ColorManager.black,
                                    blurRadius: 10.0
                                )
                              ]
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:20.0,left: 18.0,right: 18.0),
                child: Container(
                  width: double.infinity,
                  height: 118.5,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                            color: ColorManager.primary.withOpacity(.4),
                            blurRadius: 10.0,
                            spreadRadius: 1)
                      ]),
                  child: Stack(
                    children: [
                      Image(
                        image: AssetImage("assets/images/bg.jpg"),
                        fit: BoxFit.fill,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 45.0,left: 20.0),
                        child: Text(
                          data["items"][index]["shurooq"],
                          style: TextStyle(
                              color: ColorManager.white,
                              fontSize: 25.0,
                            fontWeight: FontWeight.w700,
                            shadows: [
                              Shadow(
                                color: ColorManager.black,
                                blurRadius: 10.0
                              )
                            ]
                          ),
                        ),
                      ),
                      Center(
                          child: Image(
                            image: AssetImage("assets/images/prayTime/sunrise.png"),
                            height: 40,
                            width: 40.0,
                            color: ColorManager.white,
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:30.0,left: 260.0),
                        child: Text(
                          "الشروق",
                          textDirection: TextDirection.rtl,

                          style: TextStyle(
                              color: ColorManager.white,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w700,
                              fontFamily: FontConstant.fontFamily,
                              shadows: [
                                Shadow(
                                    color: ColorManager.black,
                                    blurRadius: 10.0
                                )
                              ]
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:20.0,left: 18.0,right: 18.0),
                child: Container(
                  width: double.infinity,
                  height: 118.5,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                            color: ColorManager.primary.withOpacity(.4),
                            blurRadius: 10.0,
                            spreadRadius: 1)
                      ]),
                  child: Stack(
                    children: [
                      Image(
                        image: AssetImage("assets/images/bg.jpg"),
                        fit: BoxFit.fill,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 45.0,left: 20.0),
                        child: Text(
                          data["items"][index]["dhuhr"],
                          style: TextStyle(
                              color: ColorManager.white,
                              fontSize: 25.0,
                            fontWeight: FontWeight.w700,
                            shadows: [
                              Shadow(
                                color: ColorManager.black,
                                blurRadius: 10.0
                              )
                            ]
                          ),
                        ),
                      ),
                      Center(
                          child: Image(
                            image: AssetImage("assets/images/prayTime/duhr.png"),
                            height: 40,
                            width: 40.0,
                            color: ColorManager.white,
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:30.0,left: 280.0),
                        child: Text(
                          "الظهر",
                          textDirection: TextDirection.rtl,

                          style: TextStyle(
                              color: ColorManager.white,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w700,
                              fontFamily: FontConstant.fontFamily,
                              shadows: [
                                Shadow(
                                    color: ColorManager.black,
                                    blurRadius: 10.0
                                )
                              ]
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:20.0,left: 18.0,right: 18.0),
                child: Container(
                  width: double.infinity,
                  height: 118.5,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                            color: ColorManager.primary.withOpacity(.4),
                            blurRadius: 10.0,
                            spreadRadius: 1)
                      ]),
                  child: Stack(
                    children: [
                      Image(
                        image: AssetImage("assets/images/bg.jpg"),
                        fit: BoxFit.fill,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 45.0,left: 20.0),
                        child: Text(
                          data["items"][index]["asr"],
                          style: TextStyle(
                              color: ColorManager.white,
                              fontSize: 25.0,
                            fontWeight: FontWeight.w700,
                            shadows: [
                              Shadow(
                                color: ColorManager.black,
                                blurRadius: 10.0
                              )
                            ]
                          ),
                        ),
                      ),
                      Center(
                          child: Image(
                            image: AssetImage("assets/images/prayTime/asr.png"),
                            height: 40,
                            width: 40.0,
                            color: ColorManager.white,
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:30.0,left: 280.0),
                        child: Text(
                          "العصر",
                          textDirection: TextDirection.rtl,

                          style: TextStyle(
                              color: ColorManager.white,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w700,
                              fontFamily: FontConstant.fontFamily,
                              shadows: [
                                Shadow(
                                    color: ColorManager.black,
                                    blurRadius: 10.0
                                )
                              ]
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:20.0,left: 18.0,right: 18.0),
                child: Container(
                  width: double.infinity,
                  height: 118.5,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                            color: ColorManager.primary.withOpacity(.4),
                            blurRadius: 10.0,
                            spreadRadius: 1)
                      ]),
                  child: Stack(
                    children: [
                      Image(
                        image: AssetImage("assets/images/bg.jpg"),
                        fit: BoxFit.fill,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 45.0,left: 20.0),
                        child: Text(
                          data["items"][index]["maghrib"],
                          style: TextStyle(
                              color: ColorManager.white,
                              fontSize: 25.0,
                            fontWeight: FontWeight.w700,
                            shadows: [
                              Shadow(
                                color: ColorManager.black,
                                blurRadius: 10.0
                              )
                            ]
                          ),
                        ),
                      ),
                      Center(
                          child: Image(
                            image: AssetImage("assets/images/prayTime/magrib.png"),
                            height: 40,
                            width: 40.0,
                            color: ColorManager.white,
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:30.0,left: 280.0),
                        child: Text(
                          "المغرب",
                          textDirection: TextDirection.rtl,

                          style: TextStyle(
                              color: ColorManager.white,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w700,
                              fontFamily: FontConstant.fontFamily,
                              shadows: [
                                Shadow(
                                    color: ColorManager.black,
                                    blurRadius: 10.0
                                )
                              ]
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:20.0,left: 18.0,right: 18.0),
                child: Container(
                  width: double.infinity,
                  height: 118.5,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                            color: ColorManager.primary.withOpacity(.4),
                            blurRadius: 10.0,
                            spreadRadius: 1)
                      ]),
                  child: Stack(
                    children: [
                      Image(
                        image: AssetImage("assets/images/bg.jpg"),
                        fit: BoxFit.fill,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 45.0,left: 20.0),
                        child: Text(
                          data["items"][index]["isha"],
                          style: TextStyle(
                              color: ColorManager.white,
                              fontSize: 25.0,
                            fontWeight: FontWeight.w700,
                            shadows: [
                              Shadow(
                                color: ColorManager.black,
                                blurRadius: 10.0
                              )
                            ]
                          ),
                        ),
                      ),
                      Center(
                          child: Image(
                            image: AssetImage("assets/images/prayTime/isha.png"),
                            height: 40,
                            width: 40.0,
                            color: ColorManager.white,
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:30.0,left: 280.0),
                        child: Text(
                          "العشاء",
                          textDirection: TextDirection.rtl,

                          style: TextStyle(
                              color: ColorManager.white,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w700,
                              fontFamily: FontConstant.fontFamily,
                              shadows: [
                                Shadow(
                                    color: ColorManager.black,
                                    blurRadius: 10.0
                                )
                              ]
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      fallback: (context) => Center(
        child: CircularProgressIndicator(
        ),
      ),
    );
  }

  void getPrayDate() async{
    http.Response response = await http.get(Uri.parse('https://muslimsalat.com/Cairo/monthly.json?key=8c2a4b7d4f1bc63385fc6931276fcb72'));
    data = jsonDecode(response.body);
    print(data);
    setState(() {
    });

  }
}
