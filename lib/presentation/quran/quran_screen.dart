

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_app/presentation/resources/color_manager.dart';
import 'package:quran_app/presentation/resources/font_manager.dart';
import 'package:quran_app/presentation/resources/strings_manager.dart';
import 'package:quran_app/presentation/resources/values_manager.dart';

import 'package:quran_app/presentation/surah/surah_screen.dart';

import '../doaa/doaa_quranEnd_screen.dart';


// ignore: must_be_immutable
class QuranScreen extends StatefulWidget {
  QuranScreen({super.key , this.data = const [], this.ayahs = const {}});
  List<dynamic> data = [];
  Map<String, dynamic> ayahs = {};


  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen>
    with TickerProviderStateMixin {

  GlobalKey tabKey = GlobalKey();
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      // condition: data.isNotEmpty,
      condition: widget.ayahs.isNotEmpty,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
                child: Row(
                  children: [
                    Spacer(),
                    Text(
                      textAlign: TextAlign.start,
                      textDirection: TextDirection.rtl,
                      AppStrings.alslamAlykom,
                      style: TextStyle(
                        color: ColorManager.grey,
                        fontFamily: FontConstant.fontFamily,
                        fontWeight: FontWeight.w700,
                        fontSize: FontSize.s26,
                        shadows: [
                          Shadow(
                              color: ColorManager.grey,
                              blurRadius: 40.0,
                              offset: Offset(1, 1)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Row(
              //   children: [
              //     const Spacer(),
              //     TextButton(
              //       onPressed: () {
              //         //todo navigate to designer screen
              //       },
              //       child: Stack(
              //         alignment: Alignment.bottomCenter,
              //         children: [
              //           Text(
              //             AppStrings.designer,
              //             style: Theme.of(context).textTheme.titleMedium,
              //           ),
              //           Container(
              //             width: 90,
              //             height: 2.0,
              //             color: ColorManager.primary,
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              Padding(
                padding: const EdgeInsets.only(top: AppPadding.p20),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 151.0,
                      decoration: BoxDecoration(
                        color: ColorManager.primaryLight2,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Image.asset('assets/images/shadow1.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: AppPadding.p12, right: AppPadding.p20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppPadding.p10),
                            child: Text(
                              AppStrings.lastRead,
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ),
                          const Image(
                              image: AssetImage("assets/images/lastRead.png")),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: AppPadding.p80, right: AppPadding.p20),
                      child: Text(
                        widget.ayahs['data'][0]['name'],
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: AppPadding.p35, right: AppPadding.p150),
                      child: Image.asset('assets/images/Quran.png'),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: AppPadding.p16),
                child: DefaultTabController(
                  animationDuration: Duration(milliseconds: 800),
                  length: 2,
                  child: TabBar(
                    dividerColor: ColorManager.primary,
                    indicatorColor: ColorManager.primary,
                    labelStyle: TextStyle(fontSize: 20.0),
                    labelColor: ColorManager.primary,
                    unselectedLabelColor: ColorManager.grey,
                    tabs: [
                      Tab(
                        text: "المصحف",
                      ),
                      Tab(
                        text: "دعاء ختم القران",
                      ),

                    ],
                    controller: _tabController,
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    SurahScreen(
                      data: widget.data,
                      ayahs: widget.ayahs,
                    ),
                    QuranEndDoaaScreen(),
                  ],
                  physics: BouncingScrollPhysics(),
                ),
              ),
            ],
          ),
        );
      },
      fallback: (context) {
        return Center(
            child: CircularProgressIndicator(
          color: ColorManager.primary,
        ));
      },
    );
  }




}
