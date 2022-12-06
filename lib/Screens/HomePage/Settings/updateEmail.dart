import 'package:flutter/material.dart';
import 'package:sporty/Screens/HomePage/Settings/settings.dart';
import 'package:sporty/Utilities/colors.dart';
import 'package:sporty/Utilities/routers.dart';
import 'package:sporty/Widgets/button.dart';
import 'package:sporty/Widgets/myText.dart';
import 'package:sporty/Widgets/textField.dart';

// This UpdateEmail class allows users to change their existing Email address to a new one.

class UpdateEmail extends StatefulWidget {
  const UpdateEmail({super.key});

  @override
  State<UpdateEmail> createState() => _UpdateEmailState();
}

class _UpdateEmailState extends State<UpdateEmail> {
// Declaration of relevant textEditing to control each text form fields
  final TextEditingController _emailPasswrod = TextEditingController();
  final TextEditingController _newEmailPasswrod = TextEditingController();

  // An empty function to dispose all controllers after usage.
  @override
  void dispose() {
    _emailPasswrod.dispose();
    _newEmailPasswrod.dispose();
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
                text: 'Update Email',
                textAlign: TextAlign.center,
                color: textColor,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(height: 24),
              customTextField(
                  title: 'Enter Email',
                  controller: _emailPasswrod,
                  hint: 'example@gmail.com'),
              const SizedBox(height: 16),
              customTextField(
                  title: 'Enter New Email',
                  controller: _newEmailPasswrod,
                  hint: 'newExample@gmail.com'),
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
