import 'package:flutter/material.dart';
import 'package:sporty/Constants/size_config.dart';
import 'package:sporty/Onboarding/onboardingScreen.dart';
import 'package:sporty/Utilities/routers.dart';

import 'Utilities/colors.dart';
import 'Widgets/image.dart';
import 'Widgets/myText.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image('assets/images/splash.png'),
            const SizedBox(height: 32),
            myText(
              text: 'Sporty',
              fontSize: 40,
              fontWeight: FontWeight.w700,
              color: white,
            ),
          ],
        ),
      ),
    );
  }

  void navigate() {
    Future.delayed(const Duration(seconds: 5), () {
      PageNavigator(ctx: context).nextPageOnly(page: const OnboardingScreen());
    });
  }
}
