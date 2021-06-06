import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/AfterAuthentication/afterauth_screen.dart';
import 'Screens/Signup/signup_screen.dart';
import 'Screens/Welcome/welcome_screen.dart';
import 'authentication_service.dart';
import 'constants.dart';


//void main() => runApp(ExploreEgypt());
Future<void> main() async { //1.initialize firebase app
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ExploreEgypt());
}
class ExploreEgypt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {//5.provide both authentication CLass and user stream got from authentication class
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),//this provider provides authentication service
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationService>().authStateChanges,//access authentication service
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Authentication step',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: AuthenticationWrapper(),
      )
    );
  }
}
class AuthenticationWrapper extends StatelessWidget {//6. handle the nect scenario after successfully knowing the state of user
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return AfterAuthScreen();
    }
    return SignUpScreen();
  }
}


/*class ExploreEgypt extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Authentication step',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
    );
  }
}*/

