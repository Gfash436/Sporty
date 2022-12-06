import 'package:flutter/material.dart';
import 'package:sporty/Utilities/colors.dart';
import 'package:sporty/Widgets/myText.dart';

class Buddle extends StatelessWidget {
  const Buddle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(children: [
            const SizedBox(height: 73),
            const myText(
              text: 'Buddle',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 60),
            myText(
              text: 'Welcome to Sporty',
              color: textColor,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ]),
        ),
      ),
    );
  }
}
