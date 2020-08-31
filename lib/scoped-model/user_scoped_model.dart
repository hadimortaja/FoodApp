import 'dart:convert';

import 'package:food_delivery_app/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart'as http;

class UserModel extends Model{
  User _authenticatedUser;

  void authenticate(String email,String password)async{
    Map<String,dynamic>authData={
      "email": email,
      "password": password,
      "returnSecureToken":true
    };
    try{
      http.Response response = await http.post(
          "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyALbbRRZKoyMHYFIlZLfjjaeGfnrmi1dEQ",
          body: json.encode(authData),
          headers: {'Content-Type': ' application/json'});
      print("Printing The response body : ${response.body}");
    }catch(error){
print("The error Signing Up is : $error");
    }
  }
}