import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hand2hand/constants.dart';
import 'package:hand2hand/core/utils/app_router.dart';
import 'package:hand2hand/core/utils/functions/assets_service.dart';
import 'package:hand2hand/features/on_boarding/views/widgets/on_boarding_custom_widget.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {


    final size = MediaQuery.of(context).size;
    final List pages = [
      OnBoardingCustomWidget(
        image: AssetsService.onBoard1,
        text1: "Welcome to our Donation platform!",
        text2: "thank you for joining our community",
        textButton: 'Next',
        onPressed: () {
          _pageController.animateToPage(1,
              duration: const Duration(milliseconds: 250), curve: Curves.easeIn);
        },
      ),
      OnBoardingCustomWidget(
        image: AssetsService.onBoard2,
        text1: "Now you can make donate easily",
        text2:
            "with our doorstep pick up and drop off delivery service. you can donate easily",
        textButton: 'Next',
        onPressed: () {
          _pageController.animateToPage(2,
              duration: Duration(milliseconds: 250), curve: Curves.easeIn);
        },
      ),
      OnBoardingCustomWidget(
        image: AssetsService.onBoard3,
        text1: "Now you can schedule your donation",
        text2:
            "With giving the specify preferred date time and pickup location to collect your package",
        textButton: 'Next',
        onPressed: () {
          _pageController.animateToPage(3,
              duration: const Duration(milliseconds: 250), curve: Curves.easeIn);
        },
      ),
      OnBoardingCustomWidget(
        image: AssetsService.onBoard4,
        text1: "Now you can Donate multiple items",
        text2:
            "Win thin donation appe like food,clothes book fund, soys, medicine clectronic.e",
        textButton: 'Get Started',
        onPressed: () {
          GoRouter.of(context).pushReplacement(AppRouter.login);
        },
      ),
    ];
    return Stack(
      children: [
        PageView.builder(
          itemCount: 4,
          onPageChanged: (int page) {
            setState(() {

                currentIndex = page;

            });
          },
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(size.width * .15),
              child: pages[currentIndex],
            );
          },
          controller: _pageController,
        ),
        Positioned(
            bottom: size.height * .1,
            right: size.width * .335,
            child: Row(
              children: [
                Container(
                  height: size.height * .003,
                  width: size.width * .05,
                  color: currentIndex == 0 ? mainColor1 : Colors.grey,
                ),
                SizedBox(
                  width: size.width * .02,
                ),
                Container(
                  height: size.height * .003,
                  width: size.width * .05,
                  color: currentIndex == 1 ? mainColor1 : Colors.grey,
                ),
                SizedBox(
                  width: size.width * .02,
                ),
                Container(
                  height: size.height * .003,
                  width: size.width * .05,
                  color: currentIndex == 2 ? mainColor1 : Colors.grey,
                ),
                SizedBox(
                  width: size.width * .02,
                ),
                Container(
                  height: size.height * .003,
                  width: size.width * .05,
                  color: currentIndex == 3 ? mainColor1 : Colors.grey,
                ),
                SizedBox(
                  width: size.width * .02,
                ),
              ],
            ))
      ],
    );
  }
}
