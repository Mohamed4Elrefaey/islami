import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/core/resources/AssetsManager.dart';
import 'package:islami/core/resources/ColorsManager.dart';
import 'package:islami/model/sura_model.dart';
import 'package:islami/ui/sura_details/sura_details_screen.dart';

class SuraItem extends StatelessWidget {
  SuraModel sura;

  SuraItem({super.key, required this.sura});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDetailsScreen.routeName, arguments: sura);
      },
      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              SvgPicture.asset(AssetsManager.suraNumber),
              Text(
                sura.suraNumber.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: ColorsManager.onPrimaryColor,
                ),
              ),
            ],
          ),
          SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sura.suraNameEn,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: ColorsManager.onPrimaryColor,
                  ),
                ),
                Text(
                  "${sura.suraVerses} Verses",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: ColorsManager.onPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
          Text(
            sura.suraNameAr,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: ColorsManager.onPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
