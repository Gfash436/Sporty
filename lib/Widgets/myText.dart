import 'package:flutter/material.dart';
import 'package:sporty/Utilities/colors.dart';

//project imports

class myText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final VoidCallback? pressed;

  const myText(
      {super.key,
      required this.text,
      this.fontSize,
      this.fontWeight,
      this.color,
      this.textAlign,
      this.pressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: pressed,
        child: Text(
          text,
          textAlign: textAlign,
          style: TextStyle(
            color: color,
            fontWeight: fontWeight,
            fontSize: fontSize,
          ),
        ));
  }
}
