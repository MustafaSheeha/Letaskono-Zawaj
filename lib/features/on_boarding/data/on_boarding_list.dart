import 'package:letaskono_zawaj/core/utils/app_assets.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/features/on_boarding/data/on_boarding_model.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    imagePath: Assets.onBoardingOne,
    quoteOne: AppStrings.quran1,
    quoteTwo: AppStrings.quran2,
    quoteThree: AppStrings.quran3,
  ),
  OnBoardingModel(
    imagePath: Assets.onBoardingTwo,
    quoteOne: AppStrings.onBoardingSlagonOne,
    quoteTwo: AppStrings.onBoardingSlagonTwo,
    quoteThree: AppStrings.onBoardingSlagonThree,
  ),
  OnBoardingModel(
    imagePath: Assets.onBoardingThree,
    quoteOne: AppStrings.body1,
    quoteTwo: AppStrings.body2,
    quoteThree: AppStrings.body3,
  ),
];
