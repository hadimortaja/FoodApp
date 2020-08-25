import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/signup_page.dart';
import 'package:food_delivery_app/widgets/button.dart';
class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
bool _toggleVisibility =true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Button(btnTxt: "Sign In",),
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
    );

  }
  Widget _buildEmailTextField(){
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Your email or username",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18,
        ),
      ),
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
    );
  }
}
