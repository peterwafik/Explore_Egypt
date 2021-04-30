import 'package:explore_egypt/Screens/AfterAuthentication/description_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:explore_egypt/models/Locations.dart';
import 'package:explore_egypt/models/location_info.dart';
import 'package:explore_egypt/Screens/Form/locationForm.dart';
import 'package:flutter/widgets.dart';
import '../../constants.dart';
import '../Login/login_screen.dart';

  class AfterAuthScreen extends StatefulWidget {
    @override


    _AfterAuthScreenState stateAfter=_AfterAuthScreenState();
    _AfterAuthScreenState createState() =>stateAfter;

    BuildContext context;
    static List<Location> locations=(new locationsAll()).listobj;
  }

  class _AfterAuthScreenState extends State<AfterAuthScreen> {
    List<Location> locations=AfterAuthScreen.locations;
    //List<String> locations =[Cairo,Alexandria,Hurghada];
    //final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    @override
    Widget build(BuildContext context) {

      LoginScreen.afterScreen.context=context;
      final title = 'Dismissing Items';
      return MaterialApp(

        home: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: kPrimaryColor,
            child: Icon(Icons.add_outlined),
            onPressed: () {
              Navigator.push(
                  context , MaterialPageRoute(builder: (context) => new locationForm()));
            },
          ),
          appBar: AppBar(
            title: Text('Select'),
            centerTitle: true,

            backgroundColor: kPrimaryColor,
          ),
          body: getListView(context),
        ),
      );
    }

    Widget getListView(context) {
      print(locations.length);
      var listView = ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Dismissible(

            child: InkWell( //to make the Cards clickable
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      //leading: Icon(Icons.arrow_drop_down_circle),
                      title: Text(locations[index].name, textAlign: TextAlign.center),
                      subtitle: Text( locations[index].theme, style: TextStyle(color: Colors.black.withOpacity(0.6)),textAlign: TextAlign.center
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                    ),

                    Image.network(locations[index].imageUrl),
                    //Spacer(flex : 2),
                  ],
                ),
              ),

              /*child: Card(
                child: Container(

                  // height: 200,
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7.0),
                      ),
                      Container(
                          height: 30,
                          child: Text(
                            locations[index].name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Cinzel-Regular',
                                fontSize: 20),
                          ),
                          //margin: EdgeInsets.all(30.0)
                      ),
                      //Padding(
                       // padding: const EdgeInsets.symmetric(vertical: 3.0),
                      //),
                      Container(height: 320, width: 380, child: Image.network(locations[index].imageUrl),margin: EdgeInsets.all(20.0))
                          //EdgeInsets elli m8alebani tet7at fl container da
                    ])

                ),
              ),

               */

              onTap: () {
                Navigator.push(
                    context , MaterialPageRoute(builder: (context) => new Description(l:locations[index])));
              },
            ),

            background: Container(color: Colors.red),
            key: Key(locations[index].name),
            onDismissed: (direction) {
              setState(() {
                locations.removeAt(index);
              });

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("location dismissed")));
            },

          );

        },

      );
      return listView;

  }

  //void navigateToDescription(Location location5){
    //Navigator.push(AfterAuthScreen.context, MaterialPageRoute(builder: (context)=> Description(l:location5)));
  //}
}
