
import 'package:flutter/material.dart';
import 'package:islami/ui/home/quran_tab/widgets/mostResentlyItem.dart';

class MostResentList extends StatelessWidget {
  const MostResentList({super.key});


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
        itemBuilder: (context , index) => MostResentItem() ,
        separatorBuilder: (context , index) => SizedBox(width: 10,),
        itemCount: 10);
  }
}
