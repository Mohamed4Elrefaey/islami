import 'package:flutter/material.dart';
import 'package:islami/model/hadeth_model.dart';

import '../../../core/resources/AssetsManager.dart';
import '../../../core/resources/ColorsManager.dart';

class HadethDetailsScreen extends StatelessWidget {
  const HadethDetailsScreen({super.key});

  static const String routeName = "hadethDetailsScreen";

  @override
  Widget build(BuildContext context) {
    HadethModel hadeth =
        ModalRoute.of(context)!.settings.arguments as HadethModel;
    return Scaffold(
      backgroundColor: ColorsManager.secondaryColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: ColorsManager.secondaryColor,
        iconTheme: IconThemeData(color: ColorsManager.primaryColor),
        centerTitle: true,
        title: Text("Hadeth ${hadeth.hadethNum}"),
        titleTextStyle: TextStyle(
          fontFamily: "Janna LT",
          color: ColorsManager.primaryColor,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 18, left: 18, right: 18),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Image.asset(AssetsManager.leftCorner),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              hadeth.title,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 22,
                                color: ColorsManager.primaryColor
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Image.asset(AssetsManager.rightCorner),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        hadeth.hadethContent,
                        style: TextStyle(
                          fontFamily: "Janna LT",
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: ColorsManager.primaryColor,
                          height: 2.5,
                        ),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset(AssetsManager.bottomMosque),
        ],
      ),
    );
  }
}
