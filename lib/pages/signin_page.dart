import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/signup_page.dart';
import 'package:food_delivery_app/scoped-model/main_model.dart';
import 'package:food_delivery_app/widgets/button.dart';
import 'package:food_delivery_app/widgets/show_dialog.dart';
import 'package:scoped_model/scoped_model.dart';
class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
bool _toggleVisibility =true;
GlobalKey<FormState>_formKey =GlobalKey();
GlobalKey<ScaffoldState>_scaffoldKey =GlobalKey();

String _email;
String _password;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      key: _scaffoldKey,
      child: Form(
        key: _formKey,
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Sign In ",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 80,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text("Forgotten Password ?",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 18),)
                  ],
                ),
                SizedBox(height: 10,),
                Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                      _buildEmailTextField(),
                        SizedBox(height: 20,),
                        _buildPasswordTextField(),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                _buildSignInButton(),
                Divider(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account?",style: TextStyle(color: Color(0xFFBDC2CB),fontWeight: FontWeight.bold),),
                    SizedBox(width: 10,),
                    GestureDetector(onTap: (){
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (BuildContext context)=>SignUpPage()));
                    },
                        child: Text("Sign Up",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
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
        String errorMessage;
        if(!email.contains("@")){
          errorMessage ="Invalid Email Format";

        }
        return errorMessage;
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
//      validator: (String password){
//        String errorMessage;
//
//      },
    );
  }
  Widget _buildSignInButton(){
   return ScopedModelDescendant(
     builder: (BuildContext sctx,Widget child, MainModel model){
      return GestureDetector(
           onTap: (){
             showLoadingIndicator(context, "Signing In");
             onSubmit(model.authenticate);
           },
           child: Button(btnTxt: "Sign In",)
       );
     },

   );
  }
  void onSubmit(Function authenticate){
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      authenticate(_email, _password).then((final response){
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
