import 'package:flutter/material.dart';
import 'package:islami/core/resources/AssetsManager.dart';
import 'package:islami/core/resources/ColorsManager.dart';

class MostResentItem extends StatelessWidget {
  const MostResentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Al-Anbiya",
                  style: TextStyle(
                    fontFamily: "Janna LT",
                    color: ColorsManager.secondaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "الأنبياء",
                  style: TextStyle(
                    fontFamily: "Janna LT",
                    color: ColorsManager.secondaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "112 Verses",
                  style: TextStyle(
                    fontFamily: "Janna LT",
                    color: ColorsManager.secondaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(AssetsManager.mostResent),
        ],
      ),
    );
  }
}
