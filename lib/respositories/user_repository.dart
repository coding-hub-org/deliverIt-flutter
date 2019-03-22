import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

const USER_TOKEN = "user_token";

class UserRepository {
  final SharedPreferences sharedPreferences;

  UserRepository({@required this.sharedPreferences});

  /// TODO: implement this
  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    return 'token';
  }

  /// delete user's token on the device
  Future<void> deleteToken() async {
    await sharedPreferences.remove(USER_TOKEN);
    return;
  }

  /// Write user's token on the device
  Future<void> persistToken(String token) async {
    await sharedPreferences.setString(USER_TOKEN, token);
    return;
  }

  /// If the user logged in before, the token will be saved locally on the device
  /// Return true if token is found on device, false otherwise
  bool hasToken() {
    if (sharedPreferences.getString(USER_TOKEN) != null) {
      return true;
    } else {
      return false;
    }
  }
}
