import 'package:explore_egypt/components/text_field_container.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
   //TextEditingController passwordController ;
  const RoundedPasswordField({
    Key key,
    this.hintText,
    this.onChanged,
    TextEditingController controller,
    validator,
    //this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        //controller: passwordController,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: hintText,
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
