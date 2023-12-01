

import 'package:flutter/material.dart';
import 'package:quran_app/presentation/resources/routes_manager.dart';

import '../presentation/resources/theme_manager.dart';


class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Al-Quran',

      debugShowCheckedModeBanner: false,
      theme: ThemeManager().themeData(),
      initialRoute: Routes.splashRoute,
      onGenerateRoute: RouteGenerator.getRoute,

    );
  }
}
//
// class MyHttpOverrides extends HttpOverrides{
//
//   @override
//   HttpClient createHttpClient(SecurityContext? context){
//     return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
//   }
// }