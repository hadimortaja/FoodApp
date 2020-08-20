import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/signin_page.dart';
class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _toggleVisibility =true;
  bool _toggleConfirmVisibility =true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,//3shan bottm pixel error
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
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
                    SizedBox(height: 20,),
                    _buildConfirmPasswordTextField(),

                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text("Sign Up",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),),
              ),
            ),
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
  Widget _buildConfirmPasswordTextField(){
    return TextFormField(

      decoration: InputDecoration(
        hintText: "Confirm Password",
        suffixIcon: IconButton(
          onPressed: (){
            setState(() {
              _toggleConfirmVisibility =!_toggleConfirmVisibility;
            });
          },
          icon:_toggleConfirmVisibility ? Icon(Icons.visibility_off) :Icon(Icons.visibility),

        ),
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18,
        ),
      ),
      obscureText: _toggleConfirmVisibility  ,
    );
  }

}
