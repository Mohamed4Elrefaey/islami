import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/core/resources/AssetsManager.dart';
import 'package:islami/core/resources/ColorsManager.dart';
import 'package:islami/core/resources/StringsManager.dart';
import 'package:islami/ui/home/hadith_tab/hadithTab.dart';
import 'package:islami/ui/home/quran_tab/quranTab.dart';
import 'package:islami/ui/home/radio_tab/radioTab.dart';
import 'package:islami/ui/home/sebha_tab/sebhaTab.dart';
import 'package:islami/ui/home/tima_tab/timeTab.dart';

class Homescreen extends StatefulWidget {

  static const String routeName = "Home_screen";

  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}


class _HomescreenState extends State<Homescreen> {
  int selectedIndex = 0 ;


  List<Widget> tabs = [
    QuranTab(),
    HadithTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: ColorsManager.primaryColor,
        indicatorColor: ColorsManager.secondaryColor.withValues(alpha: 0.6),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        labelTextStyle: WidgetStateProperty.resolveWith((state) {
          return TextStyle(
            color: ColorsManager.onPrimaryColor,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          );
        }),
        onDestinationSelected: (index){
         setState(() {
           selectedIndex = index;
         });
        },
        selectedIndex: selectedIndex,
        destinations: [
          NavigationDestination(
            icon: SvgPicture.asset(AssetsManager.quranTab),
            label: StringsManager.quran,
            selectedIcon: SvgPicture.asset(AssetsManager.selectedQuranTab),
          ),
          NavigationDestination(
            icon: SvgPicture.asset(AssetsManager.hadethTab),
            label: StringsManager.hadith,
            selectedIcon: SvgPicture.asset(AssetsManager.selectedHadethTab),
          ),
          NavigationDestination(
            icon: SvgPicture.asset(AssetsManager.sebhaTab),
            label: StringsManager.sipha,
            selectedIcon: SvgPicture.asset(AssetsManager.selectedSebhaTab),
          ),
          NavigationDestination(
            icon: SvgPicture.asset(AssetsManager.radioTab),
            label: StringsManager.radio,
            selectedIcon: SvgPicture.asset(AssetsManager.selectedRadioTab),
          ),
          NavigationDestination(
            icon: SvgPicture.asset(AssetsManager.timeTab),
            label: StringsManager.Time,
            selectedIcon: SvgPicture.asset(AssetsManager.selectedTimeTab),
          ),
        ],
      ),
      body: tabs[selectedIndex],
    );
  }
}
