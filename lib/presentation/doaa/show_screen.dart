import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';

class ShowScreen extends StatefulWidget {
  ShowScreen({super.key,this.doaa =const []});

  List doaa =[];

  @override
  State<ShowScreen> createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {

  bool isRead = false ;
  int count = 0;


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
      body: ListView.separated(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 40.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          isRead ? Icon(Icons.check_box ,color: Colors.green,) : Container() ,
                          Spacer(),
                          Container(
                            width: 120.0,
                            height: 45.0,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              color: ColorManager.grey.withOpacity(.2),

                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.doaa[index]["count"].toString(),
                                  style: TextStyle(
                                      color: ColorManager.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0),
                                ),
                                Text(
                                  ": " + "عدد المرات",
                                  style: TextStyle(
                                      color: ColorManager.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0),
                                ),
                              ],
                            ),

                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image(
                                  image: AssetImage('assets/images/ayaNum.png'),
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  widget.doaa[index]['id'].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: FontSize.s16,
                                      color: ColorManager.primary),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    count++;
                    if(count ==  widget.doaa[index]["count"]){
                     setState(() {
                       isRead = true;
                       count =0;
                     });
                    }
                  },
                  child: Center(
                    child: Text(
                      widget.doaa[index]["text"],
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: FontConstant.fontFamily,
                        fontSize: 23.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Container(
            width: double.infinity,
            height: 1.0,

            color: ColorManager.grey.withOpacity(.4),
          ),
        ),
        itemCount: widget.doaa.length,
      ),
    );
  }
}
