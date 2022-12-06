import 'package:flutter/material.dart';
import 'package:sporty/Constants/size_config.dart';
import 'package:sporty/Utilities/colors.dart';
import 'package:sporty/Widgets/myText.dart';

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
        padding: const EdgeInsets.fromLTRB(20, 73, 20, 0),
        child: Center(
          child: Column(
            children: [
              myText(
                text: 'Profile',
                color: textColor,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: 50,
              ),
              CircleAvatar(
                radius: 40,
                child: Image.asset('assets/images/avatar.png'),
              ),
              const SizedBox(height: 15),
              myText(
                text: 'Sporty User',
                color: textColor,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              myText(
                text: 'example@gmail.com',
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              myText(
                text: '08012345674',
                textAlign: TextAlign.center,
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              myText(
                text: 'Football',
                textAlign: TextAlign.center,
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
