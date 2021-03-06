import 'package:explore_egypt/Screens/AfterAuthentication/myaccount_screen.dart';
import 'package:explore_egypt/Screens/Login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Screens/AfterAuthentication/profile_model/user_preferences.dart';
import '../authentication_service.dart';
import 'package:provider/provider.dart';

import '../main.dart';


class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1594616838951-c155f8d978a0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                UserPreferences.myUser.name,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                UserPreferences.myUser.name,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
      //Now let's Add the button for the Menu
      //and let's copy that and modify it
      ListTile(
        onTap: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) {
            return MyAccountsPage();
            },
          ),
          );
          },
        leading: Icon(
          Icons.person,
          color: Colors.black,
        ),
        title: Text("Your Profile"),
      ),

      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.auto_stories,
          color: Colors.black,
        ),
        title: Text("Wishlist"),
      ),


      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.settings,
          color: Colors.black,
        ),
        title: Text("Settings"),
      ),

      ListTile(
        onTap: () {
          context.read<AuthenticationService>().signOut();
           Navigator.push(context,MaterialPageRoute(builder: (context) {
             return SignupScreen();
           },
    ),
    );
    },
        leading: Icon(
          Icons.assignment_return_outlined,
          color: Colors.black,
        ),
        title: Text("Signout"),
      ),
    ]);
  }
}
