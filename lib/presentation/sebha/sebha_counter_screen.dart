import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../resources/color_manager.dart';

class SebhaCounterScreen extends StatefulWidget {
   SebhaCounterScreen({super.key ,this.data = const[] ,required this.currnetIndex});
  List<Map> data = [];
  int currnetIndex ;


  @override
  State<SebhaCounterScreen> createState() => _SebhaCounterScreenState();
}

class _SebhaCounterScreenState extends State<SebhaCounterScreen> {
  int totalTap =0 ;
  int taps =0 ;
  int dawra =0 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: Text(
                widget.data[widget.currnetIndex]["title"],
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w700,
                  color: ColorManager.black,
                ),
              ),
            ),),
          SizedBox(
            height: 70.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                Column(
                  children: [
                    Text("العدد الكلي" ,
                      style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.0,
                      color: ColorManager.grey,
                    ),
                    ),
                    Text("${totalTap.toString()}",
                      style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.0,
                      color: ColorManager.grey,
                    ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text("عدد الدورات" ,
                      style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.0,
                      color: ColorManager.grey,
                    ),
                    ),
                    Text("${dawra.toString()}",
                      style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.0,
                      color: ColorManager.grey,
                    ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Center(
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    totalTap ++ ;
                    taps++;
                  });
                  if(taps == widget.data[widget.currnetIndex]['count']){
                    setState(() {
                      dawra++;
                      taps=0;
                    });
                  }
                },
                child: new CircularPercentIndicator(
                  radius: 110.0,
                  lineWidth: 7.0,
                  percent: (taps/widget.data[widget.currnetIndex]["count"]),
                  animateFromLastPercent: true,
                  arcType: ArcType.FULL,
                  arcBackgroundColor: ColorManager.grey.withOpacity(.3),
                  center: new Text(
                    taps.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 50.0,
                      color: ColorManager.black,
                    ),
                  ),
                  progressColor: ColorManager.primary,
                )

              ),
            ),
          ),
        ],
      ),
    );



  }
}
