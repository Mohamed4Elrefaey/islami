import 'package:islami/core/resources/AssetsManager.dart';

class OnboardingModel {

  String headerImage = AssetsManager.islamiHeader;
  String image;
  String title;
  String description;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
}
