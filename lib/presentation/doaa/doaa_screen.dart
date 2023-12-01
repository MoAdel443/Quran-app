import 'package:flutter/material.dart';
import 'package:quran_app/presentation/doaa/doaa_show_screen.dart';
import 'package:quran_app/presentation/resources/color_manager.dart';
import 'package:quran_app/presentation/resources/font_manager.dart';

class DoaaScreen extends StatelessWidget {
  DoaaScreen({super.key ,required this.doaa});

  List<dynamic> doaa = [];

  List<dynamic> azkar = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return DoaaShowScreen(
                  doaa: doaa.sublist(3,),
                );
              },
            )
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              shape : StadiumBorder(side: BorderSide.none),
              child: Stack(
                children: [
                  Center(child: Image(image: AssetImage("assets/images/DoaaBG.jpg"))),
                  Center(
                    child: Text(
                      "الادعيه",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0,
                        fontFamily: FontConstant.fontFamily,
                        color: ColorManager.white
                      ),
                    ),
                  )
                ],
              ),

              clipBehavior: Clip.antiAliasWithSaveLayer,
            ),
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return DoaaShowScreen(
                  doaa: doaa.sublist(0,3),

                );
              },
            )
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              shape : StadiumBorder(side: BorderSide.none),
              child: Stack(
                children: [
                  Image(image: AssetImage("assets/images/DoaaBG.jpg")),
                  Center(
                    child: Text(
                      "الاذكار",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0,
                        fontFamily: FontConstant.fontFamily,
                        color: ColorManager.white
                      ),
                    ),
                  )
                ],
              ),

              clipBehavior: Clip.antiAliasWithSaveLayer,
            ),
          ),
        ),
      ],
    );
  }
}
