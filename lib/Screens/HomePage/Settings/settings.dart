import 'package:flutter/material.dart';
import 'package:sporty/Constants/size_config.dart';
import 'package:sporty/Screens/Authentication/loginPage.dart';
import 'package:sporty/Screens/HomePage/Settings/changePassword.dart';
import 'package:sporty/Screens/HomePage/Settings/updateEmail.dart';
import 'package:sporty/Screens/HomePage/Settings/updateUsername.dart';
import 'package:sporty/Utilities/colors.dart';
import 'package:sporty/Utilities/routers.dart';
import 'package:sporty/Widgets/myText.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 73, 20, 0),
            child: Column(
              children: [
                myText(
                  text: 'Settings',
                  textAlign: TextAlign.center,
                  color: textColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Image.asset('assets/images/password.png'),
                    SizedBox(
                      width: getProportionateScreenWidth(18),
                    ),
                    myText(
                      text: 'Change Password',
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        PageNavigator(ctx: context)
                            .nextPage(page: const ChangePassword());
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(25),
                ),
                Row(
                  children: [
                    Image.asset('assets/images/email.png'),
                    SizedBox(
                      width: getProportionateScreenWidth(18),
                    ),
                    myText(
                      text: 'Update Email',
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        PageNavigator(ctx: context)
                            .nextPage(page: const UpdateEmail());
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(25),
                ),
                Row(
                  children: [
                    Image.asset('assets/images/userName.png'),
                    SizedBox(
                      width: getProportionateScreenWidth(18),
                    ),
                    myText(
                      text: 'Update Username',
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        PageNavigator(ctx: context)
                            .nextPage(page: const UpdateUsername());
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(children: [
                  Image.asset('assets/images/logout.png'),
                  SizedBox(
                    width: getProportionateScreenWidth(18),
                  ),
                  myText(
                    pressed: () {
                      PageNavigator(ctx: context)
                          .nextPageOnly(page: const LoginPage());
                    },
                    text: 'Log Out',
                    color: red,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
