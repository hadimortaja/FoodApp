import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/custom_list_tile.dart';
import 'package:food_delivery_app/widgets/small_button.dart';
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool turnOnNotification =false;
  bool turnOnLocation =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                    height: 120,
                    width: 120,
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
                     SmallButton(btnTxt: "Edit",),
                    ],
                  )
                ],
              ),
              SizedBox(height: 30,),
              Text("Account",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Card(
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.all(16,),
                  child: Column(
                    children: <Widget>[
                    CustomListTile(icon: Icons.location_on,text:"Location"),
                      Divider(height: 10,color: Colors.grey,),

                      CustomListTile(icon: Icons.remove_red_eye,text:"Change Password"),
                      Divider(height: 10,color: Colors.grey,),
                      CustomListTile(icon: Icons.shopping_cart,text:"Shipping"),
                      Divider(height: 10,color: Colors.grey,),
                      CustomListTile(icon: Icons.payment,text:"Payment"),
                      Divider(height: 10,color: Colors.grey,),


                    ],
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Text("Notifications",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Card(
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("App Notification",style: TextStyle(fontSize: 16),),
                          Switch(value: turnOnNotification,onChanged: (bool value){
                            setState(() {
                              turnOnNotification =value;

                            });
                          },)
                        ],
                      ),
                      Divider(height: 10,color: Colors.grey,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Location Tracking",style: TextStyle(fontSize: 16),),
                          Switch(value: turnOnLocation,onChanged: (bool value){
                            setState(() {
                              turnOnLocation =value;

                            });
                          },)
                        ],
                      ),
                      Divider(height: 10,color: Colors.grey,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Text("Other",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("language",style: TextStyle(fontSize: 16),),
                        Divider(height: 30,color: Colors.grey,),
                        Text("Currency",style: TextStyle(fontSize: 16),),
                        Divider(height: 30,color: Colors.grey,),


                      ],
                    ),
                  ),
                ),




              )
            ],
          ),
        ),
      ),
    );
  }
}
