import 'package:flutter/material.dart';
import 'package:islami/ui/hadith/screen/hadeth_details_screen.dart';
import 'package:islami/ui/home/hadith_tab/hadithTab.dart';
import 'package:islami/ui/home/screen/homeScreen.dart';
import 'package:islami/ui/sura_details/sura_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      initialRoute: Homescreen.routeName,
      routes: {
        Homescreen.routeName: (_) => Homescreen(),
        SuraDetailsScreen.routeName: (_) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (_) => HadethDetailsScreen(),
      },
    );
  }
}
