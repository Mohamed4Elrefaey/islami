import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/resources/AssetsManager.dart';
import 'package:islami/core/resources/ColorsManager.dart';
import 'package:islami/model/hadeth_model.dart';
import 'package:islami/ui/hadith/screen/hadeth_details_screen.dart';

class HadethItem extends StatefulWidget {
  int index;
  int selectedIndex;

  HadethItem({required this.index, required this.selectedIndex});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadeth();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed(HadethDetailsScreen.routeName, arguments: hadethModel);
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: widget.selectedIndex == widget.index ? 0 : 20,
        ),
        padding: EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
          color: ColorsManager.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Container(
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Image.asset(AssetsManager.pageLeftCorner),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  hadethModel?.title ?? " ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Image.asset(AssetsManager.pageRightCorner),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Image.asset(AssetsManager.hadithItemBack),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset(
                            AssetsManager.hadithMosque,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            hadethModel?.hadethContent ?? " ",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 12,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              height: 1.6,
                              fontFamily: "Janna LT",
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // first time before screen loading the hadeth this model will be equal null
  HadethModel? hadethModel;

  void loadHadeth() async {
    String hadeth = await rootBundle.loadString(
      "assets/Hadeeth/h${widget.index + 1}.txt",
    );

    // Split Hadeth Content to title and content
    List<String> hadethLines = hadeth.split("\n");
    String hadethTitle = hadethLines[0];
    hadethLines.removeAt(0);
    String hadethContent = hadethLines.join(" ");
    // initialize the object hadethModel
    hadethModel = HadethModel(
      title: hadethTitle,
      hadethContent: hadethContent,
      hadethNum: widget.index + 1,
    );
    setState(() {});
  }
}
