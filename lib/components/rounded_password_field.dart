import 'package:explore_egypt/components/text_field_container.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  final String validator2 ;
   //TextEditingController passwordController ;
  const RoundedPasswordField({
    Key key,
    this.validator2 ,
    this.hintText,
    this.onChanged,
    TextEditingController controller,
    //validator, String validator2,
    //this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator:(validator2) => validator2.isEmpty ? '*Please Enter your Password' :null,


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
