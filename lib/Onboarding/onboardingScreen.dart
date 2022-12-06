// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sporty/Utilities/colors.dart';
import 'package:sporty/Screens/Authentication/login.dart';

import '../../Constants/size_config.dart';
import '../../Utilities/routers.dart';
import '../../Widgets/button.dart';
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
      "image": "assets/images/onb_img1.png",
      "title": "We sell incredibly fresh \nproduce",
      "desc":
          "We provide low to mid-income earners in urban cities\nwith accessible, affordable and quality poultry and fish\nproduce to their doorstep to ensure they are well-fed",
    },
    {
      "image": "assets/images/onb_img2.png",
      "title": "Providing a wide range of\n agriculture commodities",
      "desc":
          "We focus on the health of our soil and are pride ourselves\non being good stewards for all our resources.We enhance\nvalue by building connections across the food value chain",
    },
    {
      "image": "assets/images/onb_img3.png",
      "title": "Fresh from our Farm with\n love",
      "desc":
          "We are ready to optimise the entire value chain to \nmake farm produce sustainable, more accessible and \naffordable to Africans. A place you order easily.",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  isLastPage == onboarding.length
                      ? SizedBox(
                          height: getProportionateScreenHeight(16),
                        )
                      : TextButton(
                          onPressed: () =>
                              pageController.animateToPage(onboarding.length,
                                  duration: const Duration(
                                    seconds: 1,
                                  ),
                                  curve: Curves.linear),
                          child: const myText(
                            text: "Skip",
                            color: Colors.black,
                          ),
                        ),
                ],
              ),
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
                height: getProportionateScreenHeight(77),
              ),
              customButton(
                text: isLastPage == onboarding.length ? "Get Started" : "Next",
                tap: isLastPage == onboarding.length
                    ? () => PageNavigator(ctx: context)
                        .nextPageOnly(page: const Login())
                    : () => pageController.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                        ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(36),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                          horizontal: 16,
                        ),
                        width: currentPage == index
                            ? getProportionateScreenWidth(32)
                            : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: currentPage == index ? green : lightGrey,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        duration: const Duration(
                          milliseconds: 200,
                        ),
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
