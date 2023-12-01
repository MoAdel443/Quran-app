import 'package:flutter/material.dart';
import 'package:quran_app/presentation/surah/quran_surah_Screen.dart';
import 'package:quran_app/presentation/resources/color_manager.dart';
import 'package:quran_app/presentation/resources/font_manager.dart';
import 'package:quran_app/presentation/resources/strings_manager.dart';

// ignore: must_be_immutable
class SurahScreen extends StatelessWidget {
  List<dynamic> data =[];
  late Map<String, dynamic> ayahs = {};

  SurahScreen({super.key, this.data = const [], this.ayahs = const {}});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return QuranSurahScreen(
                    data: data[index],
                    ayahs: ayahs['data'][index],
                  );
                },
              )
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/images/ayaNum.png'),
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        data[index]['id'].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: FontSize.s16,
                            color: ColorManager.primary),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data[index]['name_translation'],
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 20.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              data[index]['type'],
                              style: TextStyle(
                                  color: ColorManager.grey,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20.0),
                            ),
                            Image(
                              image: AssetImage("assets/images/Ellipse.png"),
                              color: ColorManager.grey,
                            ),
                            Text(
                              ayahs["data"][index]["numberOfAyahs"].toString(),
                              style: TextStyle(
                                  color: ColorManager.grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0),
                            ),
                            Text(
                              ": " + AppStrings.ayahNums1,
                              style: TextStyle(
                                  color: ColorManager.grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                     ayahs["data"][index]['name'],
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600,
                          fontFamily: FontConstant.fontFamily,
                          color: ColorManager.primary),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Container(
            width: double.infinity,
            height: 1.0,
            color: ColorManager.grey.withOpacity(.25),
          );
        },
        itemCount: 114);
  }
}
