import 'package:explore_egypt/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:explore_egypt/models/location_info.dart';
import 'package:explore_egypt/main.dart';
import'package:explore_egypt/Screens/AfterAuthentication/afterauth_screen.dart';

import '../../constants.dart';
import '../AfterAuthentication/afterauth_screen.dart';
import '../Login/login_screen.dart';
class locationForm extends StatelessWidget {
  static BuildContext formContext;
  @override
  Widget build(BuildContext context) {
    formContext=context;
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.deepPurple,
        primaryColor: const Color(0xFF6F35A5),
        accentColor: const Color(0xFFF1E6FF),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: Formpage(),
    );
  }
}

class Formpage extends StatefulWidget {
  @override
  _FormpageState createState() => _FormpageState();
}

class _FormpageState extends State<Formpage> {
  Location currentLocation;
  String value1 = "";
  String value2 = "";
  String value3 = "";
  String value4 = "";
  String value5 = "";
 // Favourites fav= new Favourites();

  void _setValues() {
  currentLocation = new Location(name:value1,locationUrl: value2,theme:value3,imageUrl: value4,description: value5) ;
   // fav.elements.add(newWidget);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Form'),
      ),
      body: //Center(  //the used one 4/30/2021
         SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            Row(children: [
              Icon(Icons.add_circle_outline_sharp,
                  color: const Color(0xFF000000), size: 20.0),
              Expanded(
                child: TextField(
                  onChanged: (value) => value1 = value,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Name",
                      border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                ),
              )
            ]),
            Padding(padding: const EdgeInsets.symmetric(
                vertical: 3)),
            Row(children: [
              Icon(Icons.add_circle_outline_sharp,
                  color: const Color(0xFF000000), size: 20.0),
              Expanded(
                child: TextField(
                  onChanged: (value) => value2 = value,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Location",
                      border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                ),
              )
            ]),Padding(padding: const EdgeInsets.symmetric(
                    vertical: 3)),
            Row(children: [
                  Icon(Icons.add_circle_outline_sharp,
                      color: const Color(0xFF000000), size: 20.0),
                  Expanded(
                    child: TextField(
                      onChanged: (value) => value3 = value,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: "Theme",
                          border:
                          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                    ),
                  )
                ]),Padding(padding: const EdgeInsets.symmetric(
                    vertical: 3)),
                Row(children: [
                  Icon(Icons.add_circle_outline_sharp,
                      color: const Color(0xFF000000), size: 20.0),
                  Expanded(
                    child: TextField(
                      onChanged: (value) => value4 = value,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: "image-Url",
                          border:
                          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                    ),
                  )
                ]),Padding(padding: const EdgeInsets.symmetric(
                    vertical: 3)),
                Row(children: [
                  Icon(Icons.add_circle_outline_sharp,
                      color: const Color(0xFF000000), size: 20.0),
                  Expanded(
                    child: TextField(
                      onChanged: (value) => value5 = value,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: "Full-Description",
                          border:
                          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                    ),
                  )
                ]),Padding(padding: const EdgeInsets.symmetric(
                    vertical: 3)),
               RoundedButton(
                     text: "ADD",
                     color: kPrimaryLightColor,
                     textColor: Colors.black,
                     press: () {
                       _setValues();
                       AfterAuthScreen.locations.add(currentLocation);

                    Navigator.pop(locationForm.formContext);
                    Navigator.pop(LoginScreen.afterScreen.context);
                     LoginScreen.afterScreen=AfterAuthScreen(ExploreEgypt.currentUserMail
                         ,ExploreEgypt.currentUserPass);

                       Navigator.push(
                           locationForm.formContext , MaterialPageRoute(builder: (context) =>LoginScreen.afterScreen ));

                     },
      ),
    ]
          )


      ),
    );
  }
}
