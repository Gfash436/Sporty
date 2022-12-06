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
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: Column(children: [
                          myText(
                              text: 'Verification',
                              color: textColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                          const SizedBox(height: 32),
                          Row(
                            children: [
                              myText(
                                  text:
                                      'Code will be sent to jiona******gmail.com',
                                  color: textColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ],
                          ),
                          const SizedBox(height: 8),
                          customTextField(
                              title: 'Email Address',
                              hint: 'example@gmail.com',
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              myText(
                                  text: 'Code expires in 2 minutes',
                                  color: lightGrey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ],
                          ),
                          const SizedBox(height: 24),
                          customButton(
                              context: context,
                              text: 'Continue',
                              tap: (() {
                                Navigator.pushReplacement(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => LoginPage()));
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
