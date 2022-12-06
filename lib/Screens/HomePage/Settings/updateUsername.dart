import 'package:flutter/material.dart';
import 'package:sporty/Screens/HomePage/Settings/settings.dart';
import 'package:sporty/Screens/HomePage/homePage.dart';
import 'package:sporty/Utilities/colors.dart';
import 'package:sporty/Utilities/routers.dart';
import 'package:sporty/Widgets/button.dart';
import 'package:sporty/Widgets/myText.dart';
import 'package:sporty/Widgets/textField.dart';

// This UpdateUsername class allows users to change their existing Email address to a new one.

class UpdateUsername extends StatefulWidget {
  const UpdateUsername({super.key});

  @override
  State<UpdateUsername> createState() => _UpdateUsernameState();
}

class _UpdateUsernameState extends State<UpdateUsername> {
// Declaration of relevant textEditing to control each text form fields
  final TextEditingController _usernamePasswrod = TextEditingController();
  final TextEditingController _newUsernamePasswrod = TextEditingController();

  // An empty function to dispose all controllers after usage.
  @override
  void dispose() {
    _usernamePasswrod.dispose();
    _newUsernamePasswrod.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 73, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              myText(
                text: 'Update Username',
                textAlign: TextAlign.center,
                color: textColor,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(height: 24),
              customTextField(
                  title: 'Enter Username',
                  controller: _usernamePasswrod,
                  hint: 'username'),
              const SizedBox(height: 16),
              customTextField(
                  title: 'Enter New Username',
                  controller: _newUsernamePasswrod,
                  hint: 'new username'),
              const SizedBox(height: 64),
              customButton(
                  text: 'Save Changes',
                  tap: () {
                    PageNavigator(ctx: context)
                        .nextPageOnly(page: const Settings());
                  })
            ],
          ),
        ),
      )),
    );
  }
}
