import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseAuth{
  Future<FirebaseUser> googleSignIn();
}

class Auth implements BaseAuth{
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<FirebaseUser> googleSignIn() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount
        .authentication; // identifying the user

    final AuthCredential credential = GoogleAuthProvider
        .getCredential( // taking the credential from google
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    try {
      FirebaseUser user = (await _firebaseAuth.signInWithCredential(
          credential)).user; //login in firebase with credential
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}