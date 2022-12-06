import 'package:flutter/material.dart';
import 'package:sporty/Screens/HomePage/Settings/settings.dart';
import 'package:sporty/Utilities/colors.dart';
import 'package:sporty/Utilities/routers.dart';
import 'package:sporty/Widgets/button.dart';
import 'package:sporty/Widgets/myText.dart';
import 'package:sporty/Widgets/textField.dart';

// This ChangePassword class allows users to change their existing password to a new one.

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
// Declaration of relevant textEditing to control each text form fields
  final TextEditingController _oldPasswrod = TextEditingController();
  final TextEditingController _newPasswrod = TextEditingController();
  final TextEditingController _confirmNewPasswrod = TextEditingController();

  @override
  void dispose() {
    _oldPasswrod.dispose();
    _newPasswrod.dispose();
    _confirmNewPasswrod.dispose();
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
                text: 'Settings',
                textAlign: TextAlign.center,
                color: textColor,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(height: 24),
              passwordTextField(
                  title: 'Enter Old Password',
                  controller: _oldPasswrod,
                  hint: '********'),
              const SizedBox(height: 16),
              passwordTextField(
                  title: 'Enter New Password',
                  controller: _newPasswrod,
                  hint: '********'),
              const SizedBox(height: 16),
              passwordTextField(
                  title: 'Confirm New Password',
                  controller: _confirmNewPasswrod,
                  hint: '********'),
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
