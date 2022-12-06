import 'package:flutter/material.dart';
import 'package:sporty/Constants/size_config.dart';
import 'package:sporty/Utilities/colors.dart';
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
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(52),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.popAndPushNamed(context, 'HomePage');
                        },
                        icon: Icon(Icons.arrow_back_ios)),
                    SizedBox(
                      width: getProportionateScreenWidth(65),
                    ),
                    myText(
                      text: 'Settings ',
                      textAlign: TextAlign.center,
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(55),
                ),
                Row(
                  children: [
                    Image.asset('assets/images/empty-wallet-remove.png'),
                    SizedBox(
                      width: getProportionateScreenWidth(18),
                    ),
                    myText(
                      text: 'Payment Settings',
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: textColor,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(23),
                ),
                Row(
                  children: [
                    Image.asset('assets/images/user-cirlce-add.png'),
                    SizedBox(
                      width: getProportionateScreenWidth(18),
                    ),
                    myText(
                      text: 'Personal Information',
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: textColor,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(23),
                ),
                Row(
                  children: [
                    Image.asset('assets/images/global.png'),
                    SizedBox(
                      width: getProportionateScreenWidth(18),
                    ),
                    myText(
                      text: 'Language',
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    Spacer(),
                    Row(
                      children: [
                        myText(
                          text: ' Default(English)',
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(23),
                ),
                Row(
                  children: [
                    Image.asset('assets/images/convertshape-2.png'),
                    SizedBox(
                      width: getProportionateScreenWidth(18),
                    ),
                    myText(
                      text: 'Support',
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: textColor,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(32),
                ),
                Row(children: [
                  Image.asset('assets/images/cil_account-logout.png'),
                  SizedBox(
                    width: getProportionateScreenWidth(18),
                  ),
                  myText(
                    text: 'Log Out',
                    color: Colors.red,
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
