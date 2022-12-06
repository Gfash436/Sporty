import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sporty/Constants/size_config.dart';
import 'package:sporty/Provider/authProvider.dart';
import 'package:sporty/Screens/Authentication/loginPage.dart';
import 'package:sporty/Screens/Authentication/verification.dart';
import 'package:sporty/Utilities/colors.dart';
import 'package:sporty/Widgets/textField.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:provider/provider.dart';

import '../../../Utilities/snack_messages.dart';
import '../../../Widgets/button.dart';
import '../../../Widgets/myText.dart';
import '../../Utilities/routers.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final List<String> fields = [
    'Football',
    'Basketball',
    'Ice Hockey',
    'Motorsports',
    'Bandy',
    'Rugby',
    'Skiling',
    'Shooting'
  ];
  String? selectedValue;

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _checked = false;

  @override
  void dispose() {
    _userNameController.clear();
    _phoneController.clear();
    _emailController.clear();
    _roleController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
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
                      padding: const EdgeInsets.fromLTRB(20, 73, 20, 20),
                      child: Column(children: [
                        myText(
                            text: 'Create an Account',
                            color: textColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w600),
                        const SizedBox(height: 48),
                        customTextField(
                            title: 'User Name',
                            hint: 'Enter user name',
                            controller: _userNameController,
                            keyboardType: TextInputType.name),
                        const SizedBox(height: 16),
                        customTextField(
                            title: 'Phone Number',
                            hint: 'Enter phone number',
                            controller: _phoneController,
                            keyboardType: TextInputType.phone),
                        const SizedBox(height: 16),
                        customTextField(
                            title: 'Email',
                            hint: 'example@gmail.com',
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress),
                        const SizedBox(height: 16),
                        passwordTextField(
                            title: 'Password',
                            hint: '********',
                            controller: _passwordController),
                        const SizedBox(height: 16),
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Interested Field',
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: textColor,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              height: getProportionateScreenHeight(54),
                              padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(10)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: lightGrey),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  hint: Text(
                                    'Select field',
                                    style: TextStyle(
                                      color: textColor,
                                    ),
                                  ),
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  iconSize: 30,
                                  iconDisabledColor: lightGrey,
                                  items: fields
                                      .map((role) => DropdownMenuItem<String>(
                                            value: role,
                                            child: Text(
                                              role,
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  value: selectedValue,
                                  onChanged: (value) {
                                    _roleController.text = value!;
                                    setState(() {
                                      selectedValue = value as String;
                                    });
                                  },
                                  buttonPadding:
                                      const EdgeInsetsDirectional.only(end: 8),
                                  buttonHeight: 40,
                                  buttonWidth:
                                      MediaQuery.of(context).size.width,
                                  itemHeight: 40,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 64),
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
                              text: 'Register',
                              tap: (() {
                                PageNavigator(ctx: context)
                                    .nextPage(page: const Verification());
                                // auth.signupUser(
                                //     firstName: _userNameController.text.trim(),
                                //     email: _emailController.text.trim(),
                                //     phoneNumber: _phoneController.text.trim(),
                                //     role: _roleController.text,
                                //     password: _passwordController.text,
                                //     confirmPassword:
                                //         _confirmPasswordController.text,
                                //     context: context);
                              }));
                        }),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const myText(
                                text: "Already have an account? ",
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            const LoginPage()));
                              },
                              child: myText(
                                  text: 'Login',
                                  color: blue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        )
                      ]))),
            )));
  }
}
