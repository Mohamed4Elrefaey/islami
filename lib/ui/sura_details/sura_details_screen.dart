import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/resources/AssetsManager.dart';
import 'package:islami/core/resources/ColorsManager.dart';
import 'package:islami/model/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "sura_details";

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    SuraModel sura = ModalRoute.of(context)!.settings.arguments as SuraModel;
    if (suraText.isEmpty) {
      loadFile(sura.suraNumber);
    }
    return Scaffold(
      backgroundColor: ColorsManager.secondaryColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: ColorsManager.secondaryColor,
        iconTheme: IconThemeData(color: ColorsManager.primaryColor),
        centerTitle: true,
        title: Text(sura.suraNameEn),
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
                  Row(
                    children: [
                      Image.asset(AssetsManager.leftCorner),
                      Spacer(),
                      Text(
                        sura.suraNameAr,
                        style: TextStyle(
                          fontFamily: "Janna LT",
                          color: ColorsManager.primaryColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Spacer(),
                      Image.asset(AssetsManager.rightCorner),
                    ],
                  ),
                  Expanded(
                    child: suraText.isEmpty
                        ? Center(
                            child: CircularProgressIndicator(
                              color: ColorsManager.primaryColor,
                            ),
                          )
                        : SingleChildScrollView(
                          child: Text(
                              suraText,
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

  String suraText = "";

  void loadFile(int index) async {
    // non blocking code   --> type future
    String sura = await rootBundle.loadString("assets/Suras/${index}.txt");
    // await keyword for waiting for reading the file
    // async keyword for make the function async_lines
    // to be able to run in background and don't freeze the screen
    List<String> suraLines = sura.split("\n");
    for (int i = 0; i < suraLines.length; i++) {
      suraText += suraLines[i];
      suraText += "[${i + 1}] ";
    }
    setState(() {});
  }
}
