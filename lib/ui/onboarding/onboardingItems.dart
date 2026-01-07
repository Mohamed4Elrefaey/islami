import 'package:islami/core/resources/AssetsManager.dart';
import 'package:islami/core/resources/StringsManager.dart';
import 'package:islami/model/onboarding_model.dart';

class OnboardingItems {
  List<OnboardingModel> items = [
    OnboardingModel(
      image: AssetsManager.onboardingImage1,
      title: StringsManager.onboardingTitle1,
      description: "",
    ),

    OnboardingModel(
      image: AssetsManager.onboardingImage2,
      title: StringsManager.onboardingTitle2,
      description: StringsManager.onboardingDis1,
    ),

    OnboardingModel(
      image: AssetsManager.onboardingImage3,
      title: StringsManager.onboardingTitle3,
      description: StringsManager.onboardingDis2,
    ),

    OnboardingModel(
      image: AssetsManager.onboardingImage4,
      title: StringsManager.onboardingTitle4,
      description: StringsManager.onboardingDis3,
    ),

    OnboardingModel(
      image: AssetsManager.onboardingImage5,
      title: StringsManager.onboardingTitle5,
      description:
      StringsManager.onboardingDis4,
    ),
  ];
}
