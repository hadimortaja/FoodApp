import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50,horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Profile",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32
            ),),
            SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3 ,
                        offset: Offset(0,4),
                        color: Colors.black38
                      )
                    ],
                    image:DecorationImage(
                      image: AssetImage("assets/images/hadi.jpg"),
                      fit: BoxFit.cover
                    ),
                  ),
                 // child: Image.asset("assets/images/breakfast.png",fit: BoxFit.cover,),
                ),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Hadi G. Mortaja",style: TextStyle(
                      fontSize: 16,

                    ),),
                    SizedBox(height: 10,),
                    Text("0567609085",style: TextStyle(color: Colors.grey),),
                    SizedBox(height: 20,),
                    Container(
                      height: 25,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.blue
                        )
                      ),
                      child: Center(child: Text("Edit",style: TextStyle(color: Colors.blue,fontSize: 16),)),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
