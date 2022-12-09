import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/controller/on_boarding/cubit.dart';
import 'package:store_app/controller/on_boarding/states.dart';
import 'package:store_app/core/images.dart';
import 'package:store_app/view/widgets/onboarding/custom_botton.dart';
import 'package:store_app/view/widgets/onboarding/custom_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        OnBoardingCubit cubit = OnBoardingCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: PageView.builder(
                      controller: cubit.pageController,
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
                              height: 50,
                            ),
                            Text(
                              AppImages.onboarding[i]['des'],
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        );
                      }),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      CustomIndicatorOnBoarding(
                          pageController: cubit.pageController),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomOnBoardingBotton(
                        pageController: cubit.pageController,
                        text: "Continue",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomOnBoardingBotton(
                        text: "Skip",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
