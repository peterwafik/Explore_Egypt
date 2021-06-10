import 'package:explore_egypt/Screens/AfterAuthentication/afterauth_screen.dart';
import 'package:explore_egypt/Screens/AfterAuthentication/profile_model/user_preferences.dart';
import 'package:explore_egypt/Screens/Login/login_screen.dart';
import 'package:explore_egypt/Screens/Signup/components/social_icon.dart';
import 'package:explore_egypt/components/already_have_an_account_acheck.dart';
import 'package:explore_egypt/components/rounded_button.dart';
import 'package:explore_egypt/components/rounded_input_field.dart';
import 'package:explore_egypt/components/rounded_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../authentication_service.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';
import 'background.dart';
import 'or_divider.dart';
import 'package:explore_egypt/Screens/database.dart';
class Body extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String mailtext="";
  String passtext1="";
  String passtext2="";
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
            SizedBox(height: size.height * 0.03),
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.29,
            ),
            RoundedInputField(
              validator:(val) => val.isEmpty ? 'please Enter your Email' :null,
              hintText: "Your Email",
              controller:  emailController,
              onChanged: (value) {mailtext=value;},
            ),
            RoundedPasswordField(
              validator:(value) => value.isEmpty ? 'please Enter your Password' :null,
              hintText: "Password",
              controller: passwordController,
              onChanged: (value) {passtext1=value;},
            ),
            RoundedPasswordField(//to be edited to become confirm password
              validator:(val) => val.isEmpty ? 'please Enter your Password' :null,
              hintText: "Confirm Password",
              controller: passwordController,
              onChanged: (value) {passtext2=value;},
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () async {
                print("before if for validation");
                if(_formKey.currentState.validate()) {
                  bool isSignUp = false;
                  String x = await AuthenticationWrapper.context.read<
                      AuthenticationService>().signUp(
                    email: mailtext, password: passtext1,
                  );
                  print(x);
                  //print("after signup");
                  switch (x) {
                    case "Given String is empty or null":
                      isSignUp = false;
                      break;
                    case "The password is invalid or the user does not have a password.":
                      isSignUp = false;
                      break;
                    case "Signed up":
                      isSignUp=true;

                  }
                  print(isSignUp);
                  /*Navigator.push(context, MaterialPageRoute(builder: (context) {
                      LoginScreen.afterScreen=AfterAuthScreen();
                      return LoginScreen.afterScreen;
                    },
                  ),
                );*/
                  if ((ExploreEgypt.firebaseUser != null) && (isSignUp)) {
                    ExploreEgypt.currentUserMail = mailtext;
                    ExploreEgypt.currentUserPass = passtext1;
                    UserPreferences.myUser.name = mailtext;
                    UserPreferences.myUser.email = mailtext;
                    AfterAuthScreen.uid=ExploreEgypt.firebaseUser.uid;
                    SignupScreen.afterScreen = AfterAuthScreen(mailtext, passtext1);
                  //  await DatabaseService.updateUserData(AfterAuthScreen.locations,AfterAuthScreen.uid);
                    print("done");
                    Navigator.push(
                        context, MaterialPageRoute(
                        builder: (context) => SignupScreen.afterScreen));
                  }
                } //add here
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignupScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    )
    );
  }
}
