import 'package:mobx/mobx.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  ParseUser parseUser;

  @action
  Future _userload() async {
    ParseUser currentUser = await ParseUser
        .currentUser(); //The current user was save in the phone with SharedPrefferences
    if (currentUser == null) {
      return null;
    } else {
      parseUser = currentUser;
      print("AUTO LOGIN SUCCESS");
      var result = currentUser.login();
      result.catchError((e) {
        print(e);
      });
    }
  }

  @action
  Future<ParseUser> login(username, pass, email) async {
    var user = ParseUser(username, pass, email);
    var response = await user.login();
    if (response.success) {
      parseUser = user;
      print(user.objectId);
      return user; //Keep the user
    } else {
      print(response.error.message);
    }
  }

  @action
  Future<ParseUser> signUP(username, pass, email) async {
    var user = ParseUser(username, pass,
        email); //You can add Collumns to user object adding "..set(key,value)"
    var result = await user.create();
    if (result.success) {
      parseUser = user; //Keep the user
      print(user.objectId);
    } else {
      print(result.error.message);
    }
  }
}
