import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami/core/resources/ColorsManager.dart';
import 'package:islami/core/resources/StringsManager.dart';

import '../../../core/resources/AssetsManager.dart';
import '../../../model/sebhaModel.dart';
import 'ZekrList.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 33;
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.sebhaBack),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Image.asset(
                  AssetsManager.islamiHeader,
                  height: 0.16 * height,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  StringsManager.sebhaTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                    color: ColorsManager.onPrimaryColor,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    angle += pi / 6;
                    if (counter == 1) {
                      HandleList();
                      counter = 33;
                    } else {
                      counter--;
                    }
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  height: height * 0.48,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Center(
                          child: Image.asset(
                            AssetsManager.sebhaHead,
                            width: width * 0.3,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 74,
                        left: 0.0,
                        right: 0.0,
                        child: Transform.rotate(
                          angle: angle,
                          child: Center(
                            child: Image.asset(
                              AssetsManager.sebhaBody,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0.0,
                        right: 0.0,
                        bottom: 220,
                        child: Center(
                          child: Text(
                            ZekrList.AlAzkar[0].zekr,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 36,
                              color: ColorsManager.onPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0.0,
                        right: 0.0,
                        bottom: 140,
                        child: Center(
                          child: Text(
                            counter.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 36,
                              color: ColorsManager.onPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void HandleList() {
    SebhaModel fistZekr = ZekrList.AlAzkar[0];
    ZekrList.AlAzkar.removeAt(0);
    ZekrList.AlAzkar.add(fistZekr);
  }
}
