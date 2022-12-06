import 'package:flutter/material.dart';
import 'package:sporty/Utilities/colors.dart';

import '../../Constants/size_config.dart';
import '../../Widgets/myText.dart';

class onboardingContent extends StatelessWidget {
  const onboardingContent({
    Key? key,
    required this.image,
    required this.title,
    required this.desc,
  }) : super(key: key);
  final String image, title, desc;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Column(
      children: [
        Expanded(
          child: Image.asset(
            image,
          ),
        ),
        SizedBox(
          height: getProportionateScreenWidth(20),
        ),
        myText(
          text: title,
          textAlign: TextAlign.center,
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
        SizedBox(
          height: getProportionateScreenWidth(16),
        ),
        myText(
          text: desc,
          textAlign: TextAlign.center,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: textColor,
        ),
      ],
    );
  }
}
