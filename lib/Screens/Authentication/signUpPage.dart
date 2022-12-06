import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sporty/Constants/size_config.dart';
import 'package:sporty/Provider/authProvider.dart';
import 'package:sporty/Screens/Authentication/loginPage.dart';
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
  final List<String> roles = ['buyer', 'seller'];
  String? selectedValue;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _checked = false;

  @override
  void dispose() {
    _firstNameController.clear();
    _lastNameController.clear();
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
                      padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                      child: Column(children: [
                        myText(
                            text: 'Create an Account',
                            color: textColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                        const SizedBox(height: 32),
                        Row(
                          children: [
                            SizedBox(
                              width: getProportionateScreenWidth(160),
                              child: customTextField(
                                  title: 'First name',
                                  hint: 'Enter first name',
                                  controller: _firstNameController,
                                  keyboardType: TextInputType.name),
                            ),
                            const SizedBox(width: 12),
                            SizedBox(
                              width: getProportionateScreenWidth(160),
                              child: customTextField(
                                  title: 'Last name',
                                  hint: 'Enter last name',
                                  controller: _lastNameController,
                                  keyboardType: TextInputType.name),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        customTextField(
                            title: 'Email',
                            hint: 'example@gmail.com',
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress),
                        const SizedBox(height: 8),
                        customTextField(
                            title: 'Phone Number',
                            hint: 'Enter phone number',
                            controller: _phoneController,
                            keyboardType: TextInputType.phone),
                        const SizedBox(height: 8),
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Role',
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
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
                                    'Select role',
                                    style: TextStyle(
                                      color: lightGrey,
                                    ),
                                  ),
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  iconSize: 30,
                                  iconDisabledColor: lightGrey,
                                  items: roles
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
                        const SizedBox(height: 8),
                        passwordTextField(
                            title: 'Password',
                            hint: 'enter password',
                            controller: _passwordController),
                        const SizedBox(height: 8),
                        passwordTextField(
                            title: 'Confirm Password',
                            hint: 'enter password',
                            controller: _confirmPasswordController),
                        Row(children: [
                          Checkbox(
                            value: _checked,
                            onChanged: (
                              bool? value,
                            ) {
                              setState(() {
                                _checked = !_checked;
                              });
                            },
                          ),
                          Expanded(
                            child: myText(
                                text:
                                    'I agree to sporty terms of service and private\n policy',
                                color: lightGrey,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          )
                        ]),
                        const SizedBox(height: 8),
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
                              text: 'Sign Up',
                              tap: (() {
                                auth.signupUser(
                                    firstName: _firstNameController.text.trim(),
                                    lastName: _lastNameController.text.trim(),
                                    email: _emailController.text.trim(),
                                    phoneNumber: _phoneController.text.trim(),
                                    role: _roleController.text,
                                    password: _passwordController.text,
                                    confirmPassword:
                                        _confirmPasswordController.text,
                                    context: context);
                              }));
                        }),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: getProportionateScreenWidth(300),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Divider(
                                thickness: 1,
                                color: lightGrey,
                              )),
                              myText(
                                  text: ' or ',
                                  color: textColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                              Expanded(
                                child: Divider(
                                  color: lightGrey,
                                  thickness: 1,
                                ),
                              )
                            ],
                          ),
                        ),
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
                                  text: 'Sign In.',
                                  color: green,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        )
                      ]))),
            )));
  }
}
