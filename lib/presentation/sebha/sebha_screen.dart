import 'package:flutter/material.dart';
import 'package:quran_app/presentation/resources/color_manager.dart';
import 'package:quran_app/presentation/resources/font_manager.dart';
import 'package:sqflite/sqflite.dart';

import 'sebha_counter_screen.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController zekrController = TextEditingController();
  TextEditingController countController = TextEditingController();

  late Database database;


  List<Map> data = [];


  @override
  void initState() {
    createDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: ListView.builder (
        itemBuilder: (context, index) {
          return  Padding(
            padding: const EdgeInsets.only(left: 14.0, right: 14.0, top: 10.0),
            child: InkWell(
              onTap: ()async{
                await Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SebhaCounterScreen(data : data ,currnetIndex: index,);
                },)
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: ColorManager.primary,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          // _showPopupMenu();

                        },
                        icon: Icon(
                          Icons.more_vert,
                          color: ColorManager.white,
                        )),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            data[index]["title"],
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.w700,
                                fontFamily: FontConstant.fontFamily,
                                color: ColorManager.white),
                          ),
                          Row(
                            children: [
                              Text(
                                data[index]['count'].toString(),
                                style: TextStyle(
                                    color: ColorManager.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20.0),
                              ),
                              Text(
                                " : عدد التسبيح",
                                style: TextStyle(
                                    color: ColorManager.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: data.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          scaffoldKey.currentState!.showBottomSheet((context) => Container(
                height: 280.0,
                width: double.infinity,
                color: ColorManager.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.start,
                        controller: zekrController,
                        keyboardType: TextInputType.text,
                        cursorColor: ColorManager.primary,
                        decoration: InputDecoration(
                            label: Text("الذكر"),
                            labelStyle: TextStyle(color: ColorManager.black),
                            focusColor: ColorManager.black,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.start,
                        controller: countController,
                        keyboardType: TextInputType.number,
                        cursorColor: ColorManager.primary,
                        decoration: InputDecoration(
                            label: Text("عدد التسابيح"),
                            labelStyle: TextStyle(color: ColorManager.black),
                            focusColor: ColorManager.black,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              setState(() {
                                insertToDatabase(title: zekrController.text, count: int.parse(countController.text));
                              });
                              Navigator.pop(context);
                              zekrController.text= '';
                              countController.text= '';
                            },
                            child: Text(
                              "اضافه",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w700,
                                  color: ColorManager.white),
                            ),
                            color: Colors.green,

                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  10.0,
                                ),
                                borderSide: BorderSide.none),
                          ),
                          SizedBox(width: 20.0,),
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                              zekrController.text= '';
                              countController.text= '';
                            },
                            child: Text(
                              "الغاء",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w700,
                                  color: ColorManager.white),
                            ),
                            color: Colors.black45,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  10.0,
                                ),
                                borderSide: BorderSide.none),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
        },
        child: Icon(Icons.add),
        backgroundColor: ColorManager.primaryLight1,
      ),
    );
  }


  // void _showPopupMenu() async {
  //   await ShowMenu
  // }

  void createDatabase() async {
    database = await openDatabase(
      "tasbeh.db",
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE data (id INTEGER PRIMARY KEY, title TEXT , count INTEGER)');
      },
      onOpen: (db) {
        getDataFromDB(db);
      },
    );
  }

  void insertToDatabase({
    required String title,
    required int count,
}) async {
    await database.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO data(title, count) VALUES("$title", $count )');
      print('inserted1: $id1');
    });
  }

  void getDataFromDB(database)async{
      data = await database.rawQuery('SELECT * FROM data');
      setState(() {

      });
     print(data);
  }
}
