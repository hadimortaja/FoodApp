import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/enums/auth_mode.dart';
import 'package:food_delivery_app/pages/signin_page.dart';
import 'package:food_delivery_app/scoped-model/main_model.dart';
import 'package:food_delivery_app/widgets/show_dialog.dart';
import 'package:scoped_model/scoped_model.dart';
class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _toggleVisibility =true;
//  bool _toggleConfirmVisibility =true;

  String _email;
  String _username;
  String _password;
//  String _confirmPassword;

  GlobalKey<FormState>_formKey =GlobalKey();
  GlobalKey<ScaffoldState>_scaffoldKey =GlobalKey();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.grey.shade100,
        resizeToAvoidBottomPadding: false,//3shan bottm pixel error
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Sign Up ",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 40,),
                Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        _buildUserNameTextField(),
                        SizedBox(height: 20,),
                        _buildEmailTextField(),
                        SizedBox(height: 20,),
                        _buildPasswordTextField(),
//                    SizedBox(height: 20,),
//                    _buildConfirmPasswordTextField(),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
               _buildSignUpButton(),
                Divider(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Already have an account?",style: TextStyle(color: Color(0xFFBDC2CB),fontWeight: FontWeight.bold),),
                    SizedBox(width: 10,),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (BuildContext context)=>SignInPage()));
                      },
                        child: Text("Sign In",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );

  }
  Widget _buildUserNameTextField(){
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Username",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18,
        ),
      ),
      onSaved: (String username){
        _username = username.trim();
      },
      validator: (String username){
        String errorMsg;
        if(username.isEmpty){
          errorMsg ="Username Is required";
        }
//        if(username.length<8){
//          errorMsg ="Your username is too short";
//        }
        return errorMsg;
      },
    );
  }

  Widget _buildEmailTextField(){
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Email",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18,
        ),
      ),
      onSaved: (String email){
        _email =email.trim();
      },
      validator: (String email){
        String errorMsg;
        if(email.isEmpty){
          errorMsg ="Email Is required";
        }
        if(!email.contains("@")){
          errorMsg ="Your email Format is Incorrect";
        }
        return errorMsg;
      },
    );
  }
  Widget _buildPasswordTextField(){
    return TextFormField(

      decoration: InputDecoration(
        hintText: "Password",
        suffixIcon: IconButton(
          onPressed: (){
            setState(() {
              _toggleVisibility =!_toggleVisibility;
            });
          },
          icon:_toggleVisibility ? Icon(Icons.visibility_off) :Icon(Icons.visibility),

        ),
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18,
        ),
      ),
      obscureText: _toggleVisibility  ,
      onSaved: (String password){
        _password =password;
      },
      validator: (String password){
        String errorMsg;
        if(password.isEmpty){
          errorMsg ="The Password Is required";
        }
        return errorMsg;
      },
    );
  }
//  Widget _buildConfirmPasswordTextField(){
//    return TextFormField(
//
//      decoration: InputDecoration(
//        hintText: "Confirm Password",
//        suffixIcon: IconButton(
//          onPressed: (){
//            setState(() {
//              _toggleConfirmVisibility =!_toggleConfirmVisibility;
//            });
//          },
//          icon:_toggleConfirmVisibility ? Icon(Icons.visibility_off) :Icon(Icons.visibility),
//
//        ),
//        hintStyle: TextStyle(
//          color: Color(0xFFBDC2CB),
//          fontSize: 18,
//        ),
//      ),
//      obscureText: _toggleConfirmVisibility  ,
//      onSaved: (String value){
//
//      },
//    );
//  }
Widget _buildSignUpButton(){
  return ScopedModelDescendant(
    builder: (BuildContext sctx, Widget child, MainModel model){
return GestureDetector(
          onTap: () {
            showLoadingIndicator(context, "Signing Up...");
            onSubmit(model.authenticate);
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                "Sign Up",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      },
    );
  }

  void onSubmit(Function authenticate){
if(_formKey.currentState.validate()){

  _formKey.currentState.save();
  authenticate(_email,_password,_username,authMode: AuthMode.SignUp).then((final response){
Navigator.of(context).pop();
if(!response['hasError']){
  Navigator.of(context).pop();
  Navigator.of(context).pushReplacementNamed("/mainscreen");
}else{
Navigator.of(context).pop();
_scaffoldKey.currentState.showSnackBar(
  SnackBar(
    duration: Duration(seconds: 2),
    backgroundColor: Colors.red,
    content: Text(response['message']),
  ),
);
}
      });
    }
  }
}
