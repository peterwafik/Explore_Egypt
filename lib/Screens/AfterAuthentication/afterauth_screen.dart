import 'package:explore_egypt/Screens/AfterAuthentication/result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AfterAuthScreen extends StatelessWidget {
  //List<String> locations =[Cairo,Alexandria,Hurghada];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: getListView(context),
    );
  }

  Widget getListView(context) {
    var listView = ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.landscape),
          title: Text("Cairo"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultScreen(),
              ),
            );
          },

        ),
        ListTile(
          leading: Icon(Icons.account_balance_outlined),
          title: Text("Alexandria"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultScreen(),
              ),
            );
          },

        ),
        ListTile(
          leading: Icon(Icons.waves),
          title: Text("Hurghada"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ResultScreen(),
              ),
            );
          },
        ),
      ],
    );
    return listView;
  }
}