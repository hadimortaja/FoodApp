import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/small_button.dart';
class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("All Food Items",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding:EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    offset: Offset(0,3),
                    color: Colors.black38
                  ),
                ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    width:90 ,
                    height: 90,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/breakfast.png"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Chicken",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                      SizedBox(height: 10,),
                      Container(width:200,child: Text("This is the Description of the food Item ")),
                      SizedBox(height: 9,),
                      Container(
                        width: 200,
                        child: Row(
                          children: <Widget>[
                            Text("\u{20B5} 90.0",style: TextStyle(fontSize: 16,color: Colors.blue,fontWeight: FontWeight.bold),),
                           SizedBox(width: 90,),
                           SmallButton(btnTxt: "Buy",)

                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
