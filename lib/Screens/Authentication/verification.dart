import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sporty/Screens/Authentication/loginPage.dart';
import 'package:sporty/Utilities/colors.dart';

import '../../Widgets/button.dart';
import '../../Widgets/myText.dart';
import '../../Widgets/textField.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: white,
            body: SingleChildScrollView(
                child: Center(
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 73, 20, 0),
                        child: Column(children: [
                          myText(
                              text: 'Verification',
                              color: textColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              myText(
                                  textAlign: TextAlign.center,
                                  text:
                                      'Enter the Verification  code  send to your\nPhone Number ',
                                  color: textColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ],
                          ),
                          const SizedBox(height: 84),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                codeBox(context),
                                codeBox(context),
                                codeBox(context),
                                codeBox(context),
                              ],
                            ),
                          ),
                          const SizedBox(height: 64),
                          customButton(
                              context: context,
                              text: 'Continue',
                              tap: (() {
                                Navigator.pushReplacement(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            const LoginPage()));
                              })),
                          // const SizedBox(height: 16),
                          // GestureDetector(
                          //   onTap: () {
                          //     Navigator.pop(
                          //         context,
                          //         CupertinoPageRoute(
                          //             builder: (context) => SignUpPage()));
                          //   },
                          //   child: myText(
                          //       text: 'Back to Sign In',
                          //       color: grey,
                          //       fontSize: 13,
                          //       fontWeight: FontWeight.w400),
                          // )
                        ]))))));
  }
}
