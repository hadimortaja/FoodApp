import 'dart:convert';

import 'package:food_delivery_app/enums/auth_mode.dart';
import 'package:food_delivery_app/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart'as http;

class UserModel extends Model{
  List<User> _users = [];

  List<User> get users {
    return List.from(_users);
  }

  User _authenticatedUser;
  bool _isLoading=false;

  User get authenticatedUser {
    return _authenticatedUser;
  }


  bool get isLoading {
    return _isLoading;
  }
  Future <bool> addUserInfo(Map<String,dynamic>userInfo) async{
    _isLoading =true;
    notifyListeners();
    try{

      final http.Response response = await http.post("https://fooddelivery-fce10.firebaseio.com/users.json",
          body: json.encode(userInfo));
      final Map<String,dynamic> responseData= json.decode(response.body);
User userWithId =User(
  id: responseData['name'],
  email: userInfo['email'],
  username: userInfo['username']
);
      _users.add(userWithId);
      _isLoading =false;
      notifyListeners();
      return Future.value(true);
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return Future.value(false);

      //print("Connection Error : $e");
    }
  }

  Future<Map<String,dynamic>> authenticate(String email,String password,String username,{AuthMode authMode =AuthMode.SignIn})async{
    _isLoading =true;
    notifyListeners();
    Map<String, dynamic> authData = {
      "email": email,
      "password": password,
      "returnSecureToken": true
    };
    Map<String, dynamic> userInfo = {
      "email": email,
      "username": username,
    };

    String message;
    bool hasError =false;
    try{
      http.Response response;
      if(authMode ==AuthMode.SignUp){

        response = await http.post(
            "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyALbbRRZKoyMHYFIlZLfjjaeGfnrmi1dEQ",
            body: json.encode(authData),
            headers: {'Content-Type': ' application/json'});
        addUserInfo(userInfo);
      }else if(authMode==AuthMode.SignIn){

         response = await http.post(
            "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyALbbRRZKoyMHYFIlZLfjjaeGfnrmi1dEQ",
            body: json.encode(authData),
            headers: {'Content-Type': ' application/json'});

      }


      Map<String,dynamic>responseBody =json.decode(response.body);

      if (responseBody.containsKey('idToken')) {
        _authenticatedUser = User(
          id: responseBody['localId'],
          email: responseBody['email'],
          token: responseBody['idToken'],
          userType: 'customer',
        );
        if(authMode==AuthMode.SignUp){
          message = "Sign Up Successfully";
        }else{
          message = "Sign In Successfully";
        }
      } else {
        hasError = true;
        if (responseBody['error']['message'] == 'EMAIL_EXISTS') {
          message = "Email Already exists";
        } else if (responseBody['error']['message'] == 'EMAIL_NOT_FOUND') {
          message = "Email Does Not Exist";
        } else if (responseBody['error']['message'] == "INVALID_PASSWORD") {
          message = "Password is Incorrect";
        }
      }
      _isLoading = false;
      notifyListeners();
      return {
        'message':message,
        'hasError':hasError

      };
//      print("Printing the user token : ${_authenticatedUser.token}");
    }catch(error) {
      _isLoading = false;
      notifyListeners();
      return {
        'message': 'Failed To Sign Up Successfully',
        'hasError': !hasError,

      };
    }
  }
}