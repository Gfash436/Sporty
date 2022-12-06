import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sporty/Constants/size_config.dart';
import 'package:sporty/Screens/Authentication/signUpPage.dart';
import 'package:sporty/Widgets/myText.dart';

import '../../Utilities/colors.dart';
import '../../Widgets/button.dart';
import '../../Widgets/image.dart';
import 'loginPage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: getProportionateScreenHeight(160)),
                Container(
                    child: Column(
                  children: [
                    image('assets/images/logo.png'),
                    SizedBox(height: getProportionateScreenHeight(8)),
                    myText(
                        text: 'sporty',
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        color: textColor),
                    SizedBox(height: getProportionateScreenHeight(8)),
                    myText(
                      text: 'Here for Your daily needs',
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: textColor,
                    ),
                  ],
                )),
                SizedBox(height: getProportionateScreenHeight(80)),
                customButton2(
                    context: context,
                    text: 'Sign In',
                    tap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: ((context) => const LoginPage()),
                        ),
                      );
                    }),
                customButton(
                  context: context,
                  text: 'Sign Up',
                  tap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: ((context) => const SignUpPage()),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
