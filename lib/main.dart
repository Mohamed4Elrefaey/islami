import 'package:flutter/material.dart';
import 'package:islami/ui/hadith/screen/hadeth_details_screen.dart';
import 'package:islami/ui/home/screen/homeScreen.dart';
import 'package:islami/ui/onboarding/screen/onboardingScreen.dart';
import 'package:islami/ui/sura_details/sura_details_screen.dart';

import 'core/remote/local/prefsManager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsManager.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      initialRoute: PrefsManager.isOnboardingSeen()
          ? Homescreen.routeName
          : OnBoardingScreen.routeName,
      routes: {
        Homescreen.routeName: (_) => Homescreen(),
        SuraDetailsScreen.routeName: (_) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (_) => HadethDetailsScreen(),
        OnBoardingScreen.routeName: (_) => OnBoardingScreen(),
      },
    );
  }
}
