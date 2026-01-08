import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/core/resources/AppConstants.dart';
import 'package:islami/core/resources/AssetsManager.dart';
import 'package:islami/core/resources/ColorsManager.dart';
import 'package:islami/core/resources/StringsManager.dart';
import 'package:islami/model/sura_model.dart';
import 'package:islami/ui/home/quran_tab/widgets/SuraList.dart';
import 'package:islami/ui/home/quran_tab/widgets/most_resent_list.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  String searchText = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filteredList = AppConstants.suraList;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.quranBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Image.asset(
                AssetsManager.islamiHeader,
                height: 0.16 * height,
                fit: BoxFit.fitHeight,
              ),
              SizedBox(height: 20),
              TextField(
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                    SuraNameSearch();
                  });
                },
                cursorColor: ColorsManager.onPrimaryColor,
                style: TextStyle(
                  fontFamily: "Janna LT",
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: ColorsManager.onPrimaryColor,
                ),
                decoration: InputDecoration(
                  prefixIconConstraints: BoxConstraints(
                    maxHeight: 55,
                    maxWidth: 55,
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SvgPicture.asset(
                      AssetsManager.quranTab,
                      width: 28,
                      height: 28,
                      colorFilter: ColorFilter.mode(
                        ColorsManager.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: ColorsManager.primaryColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: ColorsManager.primaryColor),
                  ),
                  hint: Text(
                    StringsManager.suraName,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: ColorsManager.onPrimaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              if (searchText.isEmpty) ...[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    StringsManager.mostRecently,
                    style: TextStyle(
                      fontFamily: "Janna LT",
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: ColorsManager.onPrimaryColor,
                    ),
                  ),
                ),
                Container(height: height * 0.16, child: MostResentList()),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    StringsManager.surasList,
                    style: TextStyle(
                      fontFamily: "Janna LT",
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: ColorsManager.onPrimaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
              Expanded(child: SuraList(suraList: filteredList)),
            ],
          ),
        ),
      ),
    );
  }

  List<SuraModel> filteredList = [];

  SuraNameSearch() {
    if (searchText.isEmpty) {
      filteredList = AppConstants.suraList;
    } else {
      filteredList = [];
      for (int i = 0; i < AppConstants.suraList.length; i++) {
        if (AppConstants.suraList[i].suraNameEn.toLowerCase().contains(searchText.toLowerCase()) ||
            AppConstants.suraList[i].suraNameAr.contains(searchText)) {
          filteredList.add(AppConstants.suraList[i]);
        }
      }
    }
  }
}
