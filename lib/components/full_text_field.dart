import 'package:flutter/material.dart';
import 'package:chatapp/style.dart';

class FullTextField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final IconData icon;
  final Color iconColor;
  final IconData iconEnd;
  final bool obscureText;
  final TextEditingController controller;
  const FullTextField({
    Key key,
    this.hintText,
    this.onChanged,
    this.icon,
    this.iconColor,
    this.iconEnd,
    this.obscureText = false,
    this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          onChanged: onChanged,
          style: TextStyle(letterSpacing: 2.0,),
          decoration: InputDecoration(
            // contentPadding: EdgeInsets,
              icon: Icon(icon,color: iconColor),
              hintText: hintText,
              border: InputBorder.none,
              suffixIcon: Icon(iconEnd, color: iconColor,)
          ),
        )
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;

  const TextFieldContainer({
    Key key,
    this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      margin: EdgeInsets.fromLTRB(0.0,0.0,0.0,10.0),
      padding: EdgeInsets.symmetric(vertical: 2.0,horizontal: 15.0),
      decoration: BoxDecoration(
          color: lightColor,
          borderRadius: BorderRadius.circular(30.0)
      ),
      child: child,
    );
  }
}