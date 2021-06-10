import 'package:explore_egypt/Screens/AfterAuthentication/afterauth_screen.dart';
import 'package:explore_egypt/Screens/Signup/signup_screen.dart';
import 'package:explore_egypt/components/already_have_an_account_acheck.dart';
import 'package:explore_egypt/components/rounded_button.dart';
import 'package:explore_egypt/components/rounded_input_field.dart';
import 'package:explore_egypt/components/rounded_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:io';


import '../../../authentication_service.dart';
import 'package:provider/provider.dart';
import '../../../main.dart';
import '../../AfterAuthentication/profile_model/user_preferences.dart';
import '../login_screen.dart';
import 'background.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:explore_egypt/authentication_service.dart';
import 'package:explore_egypt/constants.dart';

class Body extends StatelessWidget {
  String x = "" ;//peter's last
  bool isSignIn = false ;//peter's last
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String mailtext="";
  String passtext="";
  /*final _snackBar1 = SnackBar(
    content: Text('Wrong email format'),
  );
  final _snackBar2 = SnackBar(
    content: Text('password is at least 6 chars'),
  );
  final _snackBar3 = SnackBar(
    content: Text('passwords doesnt match'),
  );*/
  Body({Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
       key:_formKey,
       child: Background(
         child: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),

            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              controller:  emailController,
              onChanged: (value) {mailtext=value;},
              validator1 : mailtext,
            ),
            RoundedPasswordField(
              hintText: "Password",
              controller: passwordController,
              onChanged: (value) {passtext=value;},
              validator2:passtext,

            ),
            RoundedButton(
              text: "LOGIN",
              press: () async {
                if(_formKey.currentState.validate()) {
                  isSignIn = false;
                  x = await AuthenticationWrapper.context.read<
                      AuthenticationService>().signUp(email: mailtext, password: passtext,);

                  switch(x){
                  case "Given String is empty or null":isSignIn=false;
                  break;
                  case "The password is invalid or the user does not have a password.":isSignIn=false;
                  break;
                  case "Signed in":isSignIn=true;
                  break;
                }



                if ((ExploreEgypt.firebaseUser != null)&&(isSignIn)) {

                  ExploreEgypt.currentUserMail=mailtext;
                  ExploreEgypt.currentUserPass=passtext;
                  UserPreferences.myUser.name=mailtext;
                  UserPreferences.myUser.email=mailtext;
                  SignupScreen.afterScreen=AfterAuthScreen(mailtext,passtext);

                  print(AfterAuthScreen.locations.length);
                  Navigator.push(context , MaterialPageRoute(builder: (context) =>SignupScreen.afterScreen ));

                }
                ExploreEgypt.currentUserMail="null";
                ExploreEgypt.currentUserPass="null";
                return SignUpScreen();


              }},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}
