import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:store_app/core/images.dart';

class CustomIndicatorOnBoarding extends StatelessWidget {
  final PageController pageController;
  const CustomIndicatorOnBoarding({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: AppImages.onboarding.length,
      effect: const ExpandingDotsEffect(
        activeDotColor: Colors.blue,
        dotColor: Colors.grey,
        dotHeight: 5,
        dotWidth: 10,
        spacing: 5,
      ),
    );
  }
}
