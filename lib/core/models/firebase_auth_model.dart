import 'package:firebase_auth/firebase_auth.dart';

import 'user.dart';


// remove this page later

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user Stream
  Stream<User> get user => _auth.onAuthStateChanged
      .map((FirebaseUser user) => _userFromFirebaseUser(user));

  // sign in with email and password
  Future signInWithEmail(String email, String password) async {
    try {
      var uid = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return uid;
    } catch (_) {
      return null;
    }
  }

  // register with email and password
  Future registerWithEmail(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      // await DatabaseService(uid: user.uid).userInfo(email);
      return _userFromFirebaseUser(user);
    } catch (_) {
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (_) {
      return null;
    }
  }
}
