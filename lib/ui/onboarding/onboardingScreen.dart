import 'package:flutter/material.dart';
import 'package:islami/core/resources/ColorsManager.dart';
import 'package:islami/core/resources/StringsManager.dart';
import 'package:islami/ui/home/screen/homeScreen.dart';
import 'package:islami/ui/onboarding/onboardingItems.dart';
import 'package:islami/ui/onboarding/widgets/onboardingPage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/remote/local/prefsManager.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  static const String routeName = "onboarding";

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = OnboardingItems();
  PageController pageController = PageController();
  bool isLastPage = false;
  int currentIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      bottomSheet: Container(
        color: ColorsManager.secondaryColor,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: 16,
            left: 16,
            right: 16
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              currentIndex == 0
                  ? SizedBox(width: 60)
                  : TextButton(
                      onPressed: () {
                        if (currentIndex > 0) {
                          pageController.previousPage(
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      child: Text(
                        StringsManager.back,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          fontFamily: "Janna LT",
                          color: ColorsManager.primaryColor,
                        ),
                      ),
                    ),

              SmoothPageIndicator(
                controller: pageController,
                count: controller.items.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 7,
                  dotWidth: 9,
                  dotColor: ColorsManager.dotColor,
                  activeDotColor: ColorsManager.primaryColor,
                  paintStyle: PaintingStyle.fill,
                ),
                onDotClicked: (index) => pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeIn,
                ),
              ),

              TextButton(
                onPressed: () async {
                  if (isLastPage) {
                    await PrefsManager.saveOnboardingSeen();
                    Navigator.pushReplacementNamed(
                      context,
                      Homescreen.routeName,
                    );
                  } else {
                    pageController.nextPage(
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeIn,
                    );
                  }
                },
                child: Text(
                  isLastPage ? StringsManager.finish : StringsManager.next,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    fontFamily: "Janna LT",
                    color: ColorsManager.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: PageView.builder(
          itemBuilder: (context, index) =>
              OnboardingPage(page: controller.items[index]),
          itemCount: controller.items.length,
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
              isLastPage = index == controller.items.length - 1;
            });
          },
        ),
      ),
    );
  }
}
