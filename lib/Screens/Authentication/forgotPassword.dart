import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporty/Provider/authProvider.dart';
import 'package:sporty/Utilities/colors.dart';
import 'package:sporty/Utilities/routers.dart';

import '../../Widgets/button.dart';
import '../../Widgets/myText.dart';
import '../../Widgets/textField.dart';
import 'newPassword.dart';
import 'signUpPage.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
                              text: 'Forgot Password',
                              color: textColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w500),
                          const SizedBox(height: 77),
                          customTextField(
                              title: 'Email',
                              hint: 'example@gmail.com',
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress),
                          const SizedBox(height: 16),
                          // Row(
                          //   children: [
                          //     myText(
                          //         text:
                          //             'A password reset link will be sent to your email.',
                          //         color: lightGrey,
                          //         fontSize: 12,
                          //         fontWeight: FontWeight.w500),
                          //   ],
                          // ),
                          const SizedBox(height: 64),
                          customButton(
                              context: context,
                              text: 'Continue',
                              tap: (() {
                                PageNavigator(ctx: context)
                                    .nextPage(page: const NewPassword());
                                // context
                                //     .read<AuthenticationProvider>()
                                //     .resetPassword(
                                //         context: context,
                                //         email: _emailController.text.trim());
                                // Navigator.push(
                                //     context,
                                //     CupertinoPageRoute(
                                //         builder: (context) =>
                                //             const NewPassword()));
                              })),
                          const SizedBox(height: 16),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          const SignUpPage()));
                            },
                            child: myText(
                                text: 'Back to Sign In',
                                color: lightGrey,
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          )
                        ]))))));
  }
}
