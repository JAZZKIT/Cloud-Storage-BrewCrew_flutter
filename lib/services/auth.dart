import 'package:brew_crew/models/theUser.dart';
import 'package:brew_crew/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TheUser? _userFromFireBaseUser(User? user) {
    return user != null ? TheUser(uid: user.uid) : null;
  }

  Stream<TheUser?> get user {
    return _auth
        .authStateChanges()
        .map(_userFromFireBaseUser); // this is the same OMG
    //.map((User? user) => _userFromFireBaseUser(user));
  }

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future signInWithEmailandPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFireBaseUser(user);
    } catch (e) {
      return null;
    }
  }

  Future signUpWithEmailandPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      await DataBaseService(uid: user!.uid)
          .updateUserData('0', 'new member', 100);
      return _userFromFireBaseUser(user);
    } catch (e) {
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e);
      return null;
    }
  }
}
