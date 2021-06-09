import 'package:flutter/material.dart';
import '../AfterAuthentication/afterauth_screen.dart';
import 'components/body.dart';

class SignupScreen extends StatelessWidget {
  static AfterAuthScreen afterScreen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
