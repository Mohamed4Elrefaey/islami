import 'package:flutter/cupertino.dart';
import 'package:islami/core/resources/AssetsManager.dart';
import 'package:islami/core/resources/ColorsManager.dart';
import 'package:islami/ui/home/hadith_tab/widgets/hadeth_item.dart';

class HadithTab extends StatefulWidget {
  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  final PageController _controller = PageController(
      viewportFraction: 0.8
  );

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsManager.secondaryColor,
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: AssetImage(AssetsManager.hadethBack),
          alignment: Alignment.topCenter,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Image.asset(
              AssetsManager.islamiHeader,
              width: width * 0.8,
              fit: BoxFit.fitWidth,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20
                ),
                child: PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  controller: _controller,
                  itemBuilder: (context, index) =>
                      HadethItem(selectedIndex: selectedIndex, index: index),
                  itemCount: 50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }




}
