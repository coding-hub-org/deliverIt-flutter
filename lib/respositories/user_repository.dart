import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

const USER_TOKEN = "user_token";

class UserRepository {
  final SharedPreferences sharedPreferences;

  UserRepository({@required this.sharedPreferences});

  Future<String> signUp({
    @required String email,
    @required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      FirebaseUser user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (user != null) {
        String token = await user.getIdToken();
        persistToken(token);
        print("createUserWithEmailAndPassword successfully");
        return token;
      }
    } on PlatformException catch (error) {
      print("error createUserWithEmailAndPassword");
      print(error.message);
      return null;
    }

    return null;
  }

  Future<String> login({
    @required String email,
    @required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    FirebaseUser user =
        await auth.signInWithEmailAndPassword(email: email, password: password);

    if (user != null) {
      String token = await user.getIdToken();
      await sharedPreferences.setString("USER_TOKEN", token);
      return token;
    }

    return null;
  }

  Future<void> logout() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      await auth.signOut();
      deleteToken();
    } catch (error) {
      print("error signOut from Firebase");
      print(error);
    }
  }

  /// Delete user's token on the device
  Future<void> deleteToken() async {
    await sharedPreferences.remove(USER_TOKEN);
    return;
  }

  /// Write user's token on the device
  Future<void> persistToken(String token) async {
    await sharedPreferences.setString(USER_TOKEN, token);
    return;
  }

  bool hasToken() {
    if (sharedPreferences.getString(USER_TOKEN) != null) {
      return true;
    } else {
      return false;
    }
  }
}
