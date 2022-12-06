import 'package:flutter/material.dart';
import 'package:sporty/Constants/size_config.dart';
import 'package:sporty/Utilities/colors.dart';

Widget customTextField(
    {String? title,
    String? hint,
    TextEditingController? controller,
    TextInputType? keyboardType,
    int? maxlines = 1}) {
  return Column(
    children: [
      Container(
        alignment: Alignment.centerLeft,
        child: Text(
          title!,
          style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
      ),
      const SizedBox(height: 8),
      Container(
        height: getProportionateScreenHeight(54),
        // margin:
        //     EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
        padding: EdgeInsets.symmetric(
            // vertical: getProportionateScreenHeight(5),
            horizontal: getProportionateScreenWidth(10)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: lightGrey),
        child: TextFormField(
          keyboardType: keyboardType,
          controller: controller,
          maxLines: maxlines,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: textColor),
              border: InputBorder.none),
        ),
      )
    ],
  );
}

class passwordTextField extends StatefulWidget {
  final String? title;
  final String? hint;
  final TextEditingController? controller;
  passwordTextField({
    super.key,
    required this.title,
    this.controller,
    this.hint,
  });

  @override
  State<passwordTextField> createState() => _passwordTextFieldState();
}

class _passwordTextFieldState extends State<passwordTextField> {
  bool _visible = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.title!,
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: getProportionateScreenHeight(54),
          // margin:
          //     EdgeInsets.symmetric(vertical: getProportionateScreenHeight(50)),
          padding: EdgeInsets.symmetric(
              // vertical: getProportionateScreenHeight(5),
              horizontal: getProportionateScreenWidth(10)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: lightGrey),
          child: TextFormField(
            obscureText: _visible,
            controller: widget.controller,
            decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: TextStyle(color: textColor),
                border: InputBorder.none,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _visible = !_visible;
                    });
                  },
                  icon: _visible
                      ? Icon(Icons.visibility, color: textColor)
                      : Icon(Icons.visibility_off, color: textColor),
                )),
          ),
        )
      ],
    );
  }
}
