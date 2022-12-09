import 'package:flutter/material.dart';
import 'package:store_app/core/images.dart';
import 'package:store_app/view/widgets/onboarding/custom_botton.dart';
import 'package:store_app/view/widgets/onboarding/custom_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: PageView.builder(
                  controller: pageController,
                  itemCount: AppImages.onboarding.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, i) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        Image.asset(
                          AppImages.onboarding[i]['image'],
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          AppImages.onboarding[i]['des'],
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(fontSize: 18, color: Colors.grey),
                        ),
                      ],
                    );
                  }),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  CustomIndicatorOnBoarding(pageController: pageController),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomOnBoardingBotton(
                    pageController: pageController,
                    text: "Continue",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomOnBoardingBotton(
                    text: "Skip",
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
