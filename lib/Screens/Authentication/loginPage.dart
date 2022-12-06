import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sporty/Constants/size_config.dart';
import 'package:sporty/Provider/authProvider.dart';

import 'package:sporty/Screens/Authentication/forgotPassword.dart';
import 'package:sporty/Screens/HomePage/discover.dart';
import 'package:sporty/Screens/HomePage/homePage.dart';
import 'package:sporty/Screens/HomePage/profile.dart';
import 'package:sporty/Screens/HomePage/settings.dart';
import 'package:sporty/Utilities/colors.dart';
import 'package:sporty/Utilities/snack_messages.dart';
import 'package:sporty/Widgets/textField.dart';
import 'package:provider/provider.dart';

import '../../Utilities/routers.dart';
import '../../Widgets/button.dart';
import '../../Widgets/myText.dart';

import 'signUpPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _loginEmailController = TextEditingController();
  final TextEditingController _loginPasswordController =
      TextEditingController();

  bool _checked = false;

  @override
  void dispose() {
    _loginEmailController.clear();
    _loginPasswordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 73, 20, 0),
              child: Column(children: [
                myText(
                    text: 'Login',
                    color: textColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
                const SizedBox(height: 77),
                customTextField(
                    title: 'Email',
                    hint: 'example@gmail.com',
                    controller: _loginEmailController,
                    keyboardType: TextInputType.emailAddress),
                const SizedBox(height: 16),
                passwordTextField(
                    title: 'Password',
                    hint: '********',
                    controller: _loginPasswordController),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const ForgotPassword()));
                    },
                    child: myText(
                        pressed: () {
                          PageNavigator(ctx: context)
                              .nextPage(page: const ForgotPassword());
                        },
                        text: 'Forgot Password ?',
                        color: textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  )
                ]),
                const SizedBox(height: 62),
                Consumer<AuthenticationProvider>(
                    builder: (context, auth, snapshot) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (auth.resMessage != "") {
                      successMessage(
                          message: auth.resMessage, context: context);

                      //clear the response message to avoide duplicate
                      auth.clear();
                    }
                  });
                  return customButton(
                    context: context,
                    text: 'Login',
                    tap: (() {
                      PageNavigator(ctx: context)
                          .nextPage(page: const HomePage());
                      // auth.LoginUser(
                      //     email: _loginEmailController.text.trim(),
                      //     password: _loginPasswordController.text,
                      //     context: context);
                    }),
                  );
                }),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const myText(
                      text: "Don't have an account? ",
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    GestureDetector(
                      onTap: () {
                        PageNavigator(ctx: context)
                            .nextPage(page: const SignUpPage());
                      },
                      child: myText(
                          text: 'Register.',
                          color: blue,
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
