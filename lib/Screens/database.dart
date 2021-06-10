

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:explore_egypt/models/location_info.dart';


class DatabaseService{
 static CollectionReference users=FirebaseFirestore.instance
     .collection('users');


  //  final CollectionReference locationsCollection=FirebaseFirestore.instance.collection('locations');

    static Future updateUserData(List<Location> locations,String uid) async {
 //     await users.doc(uid).delete();

      for(int i=0;i<locations.length;i++){
        print(i);
        await users.doc(uid).collection('locations').doc(i.toString()).set(
        {
            'name': locations[i].name,
            'description':locations[i].description
          ,  'theme': locations[i].theme,
            'imageUrl':locations[i].imageUrl,

              'locationUrl':locations[i].locationUrl


    });
      }

        return null;

    }

}