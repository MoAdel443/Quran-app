import 'package:flutter/material.dart';
import 'package:quran_app/presentation/doaa/show_screen.dart';
import 'package:quran_app/presentation/resources/font_manager.dart';

import '../resources/color_manager.dart';

class DoaaShowScreen extends StatelessWidget {
  DoaaShowScreen({super.key, this.doaa = const []});
  List<dynamic> doaa = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "الادعيه",
          style: TextStyle(
              fontSize: 24,
              // fontFamily: FontConstant.fontFamily,
              fontWeight: FontWeight.w800,
              color: ColorManager.primary),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(
              Icons.dark_mode_outlined,
              size: 35.0,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context)=> ShowScreen(doaa : doaa[index]['array']),
                  )
              );
            },
            child: Card(
              color: ColorManager.primary,
              shape: StadiumBorder(side: BorderSide()),
              margin: EdgeInsets.all(9.0),
              shadowColor: ColorManager.primary.withOpacity(.7),
              elevation: 7.0,
              child: Center(
                child: Text(
                  doaa[index]["category"],
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: FontConstant.fontFamily,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        itemCount: doaa.length,
      ),
    );
  }
}
