import 'package:flutter/material.dart';
import 'package:store_app/core/images.dart';
import 'package:store_app/services/services.dart';
import 'package:store_app/view/screens/login.dart';

class CustomOnBoardingBotton extends StatelessWidget {
  final PageController? pageController;
  final String text;
  const CustomOnBoardingBotton({
    super.key,
    this.pageController,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    int currentPage = 0;
    return Container(
      height: 40,
      width: 300,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: MaterialButton(
          color: Colors.blue.withOpacity(.9),
          onPressed: () {
            if (text == 'Continue') {
              currentPage++;
              if (currentPage > AppImages.onboarding.length - 1) {
                sharedPreferences?.setBool('onboarding', true).then((value) {
                  if (value == true) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                        (route) => false);
                  }
                });
              } else {
                pageController?.nextPage(
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.fastLinearToSlowEaseIn);
              }
            } else {
              sharedPreferences?.setBool('onboarding', true).then((value) {
                if (value == true) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ),
                      (route) => false);
                }
              });
            }
          },
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontFamily: "cairo",
            ),
          )),
    );
  }
}
