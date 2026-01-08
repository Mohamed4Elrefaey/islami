import 'package:flutter/material.dart';
import 'package:islami/core/resources/AppConstants.dart';
import 'package:islami/ui/home/quran_tab/widgets/sura_item.dart';

import '../../../../model/sura_model.dart';

class SuraList extends StatelessWidget {

  List<SuraModel> suraList ;

   SuraList({required this.suraList});


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) =>
          SuraItem(sura: suraList[index]),
      separatorBuilder: (context, index) =>
          Divider(indent: 20, endIndent: 20, height: 20),
      itemCount: suraList.length,
    );
  }
}
