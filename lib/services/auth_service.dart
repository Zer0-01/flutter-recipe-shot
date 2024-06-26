import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_recipe_shot/models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserModel? _userModelFromFirebase(User? user) {
    if (user != null) {
      return UserModel(uid: user.uid);
    } else {
      return null;
    }
  }

  Future signInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;

      return _userModelFromFirebase(user);
    } catch (e) {
      return null;
    }
  }

  // auth change user stream
  Stream<UserModel?> get onAuthStateChanged {
    return _auth.authStateChanges().map(_userModelFromFirebase);
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signIn(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signUp(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;

      return _userModelFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  
}
