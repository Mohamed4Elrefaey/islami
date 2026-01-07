import 'package:flutter/material.dart';
import 'package:islami/core/resources/ColorsManager.dart';
import 'package:islami/model/onboarding_model.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingModel page;

  OnboardingPage({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: ColorsManager.secondaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SafeArea(child: Image.asset(page.headerImage , width: width * 0.7, fit: BoxFit.fitWidth,)),
          SizedBox(height: height * 0.03),
          Image.asset(page.image ,),
          SizedBox(height: height * 0.04),
          Text(
            page.title,
            style: TextStyle(
              color: ColorsManager.primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: height*0.02,),
          Text(
            page.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorsManager.primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: height*0.10,),
        ],
      ),
    );
  }
}
