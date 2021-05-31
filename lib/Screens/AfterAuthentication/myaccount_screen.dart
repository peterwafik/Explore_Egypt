//import 'package:explore_egypt/sidebar/navigation_bloc.dart';
import 'package:explore_egypt/Screens/AfterAuthentication/profile_model/user.dart';
import 'package:explore_egypt/Screens/AfterAuthentication/profile_model/user_preferences.dart';
import 'package:explore_egypt/Screens/AfterAuthentication/profile_widgets/appbar_widget.dart';
import 'package:explore_egypt/Screens/AfterAuthentication/profile_widgets/numbers_widget.dart';
import 'package:explore_egypt/Screens/AfterAuthentication/profile_widgets/profile_widget.dart';
import 'package:explore_egypt/components/sidebar.dart';
import 'package:explore_egypt/constants.dart';
import 'package:flutter/material.dart';

class MyAccountsPage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<MyAccountsPage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 24),
          NumbersWidget(),
          const SizedBox(height: 48),
          buildAbout(user),
        ],
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
    );
  }

  Widget buildName(User user) => Column(
    children: [
      Text(
        user.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      const SizedBox(height: 4),
      Text(
        user.email,
        style: TextStyle(color: Colors.grey),
      )
    ],
  );

  Widget buildAbout(User user) => Container(
    padding: EdgeInsets.symmetric(horizontal: 48),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text(
          user.about,
          style: TextStyle(fontSize: 16, height: 1.4),
        ),
      ],
    ),
  );
}
