import 'package:explore_egypt/Screens/AfterAuthentication/afterauth_screen.dart';
import 'package:explore_egypt/Screens/database.dart';
import 'package:explore_egypt/main.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'models/locations.dart';
import 'models/location_info.dart';
class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);//3.to pass actual firebase of class coming from firebase SDK

  /// Changed to idTokenChanges as it updates depending on more cases.
  Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();//4.firebase of statechanges getter that returns either the user or null

  /// This won't pop routes so you could do something like
  /// Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  /// after you called this method if you want to pop all routes.
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  /// There are a lot of different ways on how you can do exception handling.
  /// This is to make it as easy as possible but a better way would be to
  /// use your own custom class that would take the exception and return better
  /// error messages. That way you can throw, return or whatever you prefer with that instead.
  Future<String> signIn({String email, String password}) async {
    try {

      List<Location> x=[];
      UserCredential  result= await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      User user =result.user;
      CollectionReference locationsColl= await DatabaseService.users.doc(user.uid).collection('locations').get().then((querySnapshot) {

        querySnapshot.docs.forEach((element) {x.add(Location(theme:element.get('theme') ,name: element.get('name'),description: element.get('description'),imageUrl: element.get('imageUrl'),locationUrl: element.get('locationUrl'),id: int.parse(element.id)));});


      });
      print(x.length);
      AfterAuthScreen.locations=x;
      AfterAuthScreen.uid=user.uid;
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  /// There are a lot of different ways on how you can do exception handling.
  /// This is to make it as easy as possible but a better way would be to
  /// use your own custom class that would take the exception and return better
  /// error messages. That way you can throw, return or whatever you prefer with that instead.
  Future<String> signUp({String email, String password}) async {
    try {

      print("FireStore Created");
       UserCredential  result= await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      User user =result.user;
      ExploreEgypt.firebaseUser=user;
       List<Location> locations=new locationsAll().listobj;
    AfterAuthScreen.locations=locations;
      await DatabaseService.updateUserData(locations,user.uid);



      return "Signed up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
