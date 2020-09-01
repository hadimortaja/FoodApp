import 'dart:convert';

import 'package:food_delivery_app/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart'as http;

class UserModel extends Model{
  User _authenticatedUser;
  bool _isLoading=false;

  User get authenticatedUser {
    return _authenticatedUser;
  }


  bool get isLoading {
    return _isLoading;
  }

  Future<Map<String,dynamic>> authenticate(String email,String password)async{
    _isLoading =true;
    notifyListeners();
    Map<String, dynamic> authData = {
      "email": email,
      "password": password,
      "returnSecureToken": true
    };
    String message;
    bool hasError =false;
    try{
      http.Response response = await http.post(
          "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyALbbRRZKoyMHYFIlZLfjjaeGfnrmi1dEQ",
          body: json.encode(authData),
          headers: {'Content-Type': ' application/json'});
      Map<String,dynamic>responseBody =json.decode(response.body);

      print("The response body again is : $responseBody");
      if (responseBody.containsKey('idToken')) {
        _authenticatedUser = User(
          id: responseBody['localId'],
          email: responseBody['email'],
          token: responseBody['idToken'],
          userType: 'customer',
        );
        message = "Sign Up Successfully";
      } else {
        if (responseBody['error']['message'] == 'EMAIL_EXISTS') {
          hasError =true;
          message = "Email Already exists";
//  print("Email Already exists");
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