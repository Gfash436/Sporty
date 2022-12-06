import 'package:flutter/material.dart';
import 'package:sporty/Constants/size_config.dart';
import 'package:sporty/Utilities/colors.dart';
import 'package:sporty/Widgets/myText.dart';
import 'package:sporty/Widgets/textField.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      icon: const Icon(Icons.arrow_back_ios)),
                  SizedBox(
                    width: getProportionateScreenWidth(100),
                  ),
                  myText(
                    text: 'Profile',
                    textAlign: TextAlign.center,
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(32),
              ),
              // Center(
              //   child:
              //   myImage('assets/images/Ellipse 65.png')),
              SizedBox(
                height: getProportionateScreenHeight(16),
              ),
              const Center(
                child: myText(
                  text: 'Adedoyin Adebayo',
                  textAlign: TextAlign.center,
                  color: Color(0xffA09892),
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(32),
              ),
              myText(
                text: 'First Name',
                textAlign: TextAlign.center,
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: getProportionateScreenHeight(8),
              ),
              customTextField(
                hint: "Adedoyin",
                controller: userNameController,
                keyboardType: TextInputType.name,
                // obscureText: false,
                // validator: Validator().validateFullName,
              ),
              SizedBox(
                height: getProportionateScreenHeight(16),
              ),
              myText(
                text: 'Last Name',
                textAlign: TextAlign.center,
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),

              SizedBox(height: getProportionateScreenHeight(16)),
              myText(
                text: 'Email Address',
                textAlign: TextAlign.center,
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: getProportionateScreenHeight(8),
              ),
              customTextField(
                hint: "adedoyin@gmail.com",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                // obscureText: false,
              ),
              SizedBox(
                height: getProportionateScreenHeight(16),
              ),
              myText(
                text: 'Phone Number',
                textAlign: TextAlign.center,
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: getProportionateScreenHeight(8),
              ),
              customTextField(
                hint: "07051086838",
                controller: phoneController,
                keyboardType: TextInputType.phone,
                // obscureText: false,
                // validator: Validator().validatePhoneNumber,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
