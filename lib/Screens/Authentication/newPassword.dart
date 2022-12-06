import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sporty/Utilities/colors.dart';

import '../../Widgets/button.dart';
import '../../Widgets/myText.dart';
import '../../Widgets/textField.dart';
import 'loginPage.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _passwordController.clear();
    _passwordController.clear();
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
                              text: 'Create New Password',
                              color: textColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                          const SizedBox(height: 77),
                          passwordTextField(
                              title: 'New Password',
                              hint: '********',
                              controller: _passwordController),
                          const SizedBox(height: 16),
                          passwordTextField(
                              title: 'Confirm New Password',
                              hint: '********',
                              controller: _confirmPasswordController),
                          const SizedBox(height: 64),
                          customButton(
                              context: context,
                              text: 'Continue',
                              tap: (() {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => LoginPage()));
                              })),
                        ]))))));
  }
}
