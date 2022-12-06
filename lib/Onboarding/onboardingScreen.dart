// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sporty/Screens/Authentication/loginPage.dart';
import 'package:sporty/Utilities/colors.dart';

import '../../Constants/size_config.dart';
import '../../Utilities/routers.dart';
import '../../Widgets/myText.dart';
import 'onboarding_contents.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  bool isCurrentPage = true;
  int currentPage = 0;
  int isLastPage = 1;
  final List<Map<String, String>> onboarding = [
    {
      "image": "assets/images/onboarding1.png",
      "title": "Welcome to Sporty App",
      "desc":
          "Sporty App is where we\nhelp your with your\nintrested field in sport",
    },
    {
      "image": "assets/images/onboarding2.png",
      "title": "Choose a Favorite  sport",
      "desc":
          "We are allow one to choose a\nfavorite sport of your choice and\nbuild yourself",
    },
    {
      "image": "assets/images/onboarding3.png",
      "title": "Building An Intrested Field",
      "desc":
          "We help one in building an\nIntrested Field of your choice in\nsport",
    },
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(33),
              ),
              Expanded(
                child: PageView.builder(
                  itemCount: onboarding.length,
                  onPageChanged: ((value) => setState(() {
                        currentPage = value;
                        isLastPage = currentPage + 1;
                      })),
                  controller: pageController,
                  itemBuilder: (context, index) => onboardingContent(
                    image: "${onboarding[index]["image"]}",
                    title: "${onboarding[index]["title"]}",
                    desc: "${onboarding[index]["desc"]}",
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(65),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ...List.generate(
                    onboarding.length,
                    (index) => GestureDetector(
                      onTap: () => pageController.animateToPage(
                        index,
                        duration: const Duration(seconds: 1),
                        curve: Curves.linear,
                      ),
                      child: AnimatedContainer(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: currentPage == index ? blue : ash,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        duration: const Duration(
                          milliseconds: 200,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: TextButton(
                      onPressed: isLastPage == onboarding.length
                          ? () => PageNavigator(ctx: context)
                              .nextPageOnly(page: const LoginPage())
                          : () =>
                              pageController.animateToPage(onboarding.length,
                                  duration: const Duration(
                                    seconds: 1,
                                  ),
                                  curve: Curves.linear),
                      child: myText(
                        text: isLastPage == onboarding.length ? "Next" : "Skip",
                        color: blue,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
