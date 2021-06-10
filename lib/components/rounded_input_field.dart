import 'package:explore_egypt/components/text_field_container.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class RoundedInputField extends StatelessWidget {
  //final TextEditingController emailController ;
  final String validator1 ;
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.validator1 ,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    //this.emailController,
    TextEditingController controller,
    // validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator:(validator1) => validator1.isEmpty ? '*Please Enter your Email' :null,

        //controller: emailController,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,


        ),
      ),
    );
  }
}
