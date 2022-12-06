import 'package:flutter/material.dart';
import 'package:sporty/Utilities/colors.dart';
import 'package:sporty/Widgets/myText.dart';

class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(children: [
            const SizedBox(height: 73),
            myText(
              text: 'Discover',
              color: textColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 60),
            const myText(
              textAlign: TextAlign.center,
              text: 'Discover more about\nSporty',
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ]),
        ),
      ),
    );
  }
}
