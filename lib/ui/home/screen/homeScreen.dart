import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/core/resources/AssetsManager.dart';
import 'package:islami/core/resources/ColorsManager.dart';
import 'package:islami/core/resources/StringsManager.dart';

class Homescreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primaryColor,
      bottomNavigationBar: NavigationBar(
          destinations: [
            NavigationDestination(
                icon: SvgPicture.asset(AssetsManager.quranTab),
                label: StringsManager.quran,
              selectedIcon: SvgPicture.asset(AssetsManager.selectedQuranTab),
            ),
            NavigationDestination(
                icon: SvgPicture.asset(AssetsManager.quranTab),
                label: StringsManager.quran,
              selectedIcon: SvgPicture.asset(AssetsManager.selectedQuranTab),
            ),
            NavigationDestination(
                icon: SvgPicture.asset(AssetsManager.quranTab),
                label: StringsManager.quran,
              selectedIcon: SvgPicture.asset(AssetsManager.selectedQuranTab),
            ),
            NavigationDestination(
                icon: SvgPicture.asset(AssetsManager.quranTab),
                label: StringsManager.quran,
              selectedIcon: SvgPicture.asset(AssetsManager.selectedQuranTab),
            ),
            NavigationDestination(
                icon: SvgPicture.asset(AssetsManager.quranTab),
                label: StringsManager.quran,
              selectedIcon: SvgPicture.asset(AssetsManager.selectedQuranTab),
            ),
          ]),
    );
  }
}
