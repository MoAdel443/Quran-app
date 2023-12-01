


import 'package:flutter/material.dart';
import 'package:quran_app/presentation/resources/color_manager.dart';
import 'package:quran_app/presentation/resources/values_manager.dart';
import 'package:quran_app/presentation/sebha/sebha_screen.dart';
import '../doaa/doaa_screen.dart';
import '../quran/quran_screen.dart';
import '../salah/salah_screen.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  List<dynamic> data = [];
  List<dynamic> doaa = [];
  Map<String , dynamic> ayahs ={};

  HomeScreen({super.key ,this.data=const[],this.doaa=const[],this.ayahs=const{}});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;



  List<String> title = [
    'القران الكريم',
    "مواقيت الصلاة",
    "الادعيه",
    "المحفوظات",
  ];
  late List<Widget> screens = [
    QuranScreen(data: widget.data,ayahs: widget.ayahs),
    SalahScreen(),
    DoaaScreen(doaa: widget.doaa,),
    SebhaScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/images/appbarLeading.png'),
        title: Text(
          title[currentIndex],
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Icon(Icons.dark_mode_outlined,size: 30.0,),
          )
        ],
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorManager.white,
        selectedIconTheme: IconThemeData(color: ColorManager.primary),
        unselectedIconTheme: IconThemeData(color: ColorManager.grey),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 10.0,
        iconSize: AppSize.s14,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/home.png'),
            activeIcon: Image.asset('assets/images/homeActive.png'),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/salah.png'),
            activeIcon: Image.asset('assets/images/salahActive.png'),
            label: "salah",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/doaa.png'),
            activeIcon: Image.asset('assets/images/doaaActive.png'),
            label: "doaa",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/bookmark.png'),
            activeIcon: Image.asset('assets/images/bookmarkActive.png'),
            label: "bookmark",
          ),
        ],
      ),
    );
  }


}
