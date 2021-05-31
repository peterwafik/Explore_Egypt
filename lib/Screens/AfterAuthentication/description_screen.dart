//import 'package:explore_egypt/sidebar/navigation_bloc.dart';
import 'package:explore_egypt/components/sidebar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:explore_egypt/models/location_info.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants.dart';
class Description extends StatelessWidget {
  Location l;
  //constructor
  Description({this.l}){

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        child: Icon(Icons.add_location_alt),
        onPressed: () {
          //print("1");
          launch(l.locationUrl);
          //html.window.open(l.loc, 'location');
        },
      ),
      appBar: AppBar(

        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: kPrimaryColor,
        title: Text(
          l.name,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        //title: Text(l.name),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
          ),
          Container(
            width: 200,
            height: 200,
            child: Image.network(l.imageUrl),
          ),

          Container(
              padding:
              const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20),
              child: Text(
                l.description,
                style: TextStyle(fontSize: 20, fontFamily: 'Cinzel-Regular'),
              )),
        ],
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
    );
  }
}

_launchURL(url) async {
  const url = 'https://flutter.dev';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}