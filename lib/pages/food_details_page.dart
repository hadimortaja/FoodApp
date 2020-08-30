import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food_model.dart';
import 'package:food_delivery_app/widgets/button.dart';
import 'package:food_delivery_app/widgets/small_button.dart';
class FoodDetailsPage extends StatelessWidget {

  final Food food;
  FoodDetailsPage({this.food});
  var _mediumSpace =SizedBox(height: 20,);
  var _smallSpace =SizedBox(height: 10,);
  var _largeSpace =SizedBox(height: 50,);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text("Food Details",style: TextStyle(fontSize:16,color: Colors.black),),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset("assets/images/breakfast.png",fit: BoxFit.cover,),
                ),
                _mediumSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(food.name,style: TextStyle(fontSize: 16,color: Colors.black),),
                    Text("\u{20b5}${food.price.toString()}",style: TextStyle(fontSize: 16,color: Theme.of(context).primaryColor),),
                  ],
                ),
                _mediumSpace,
                Text("Description:",style: TextStyle(fontSize: 16,color: Colors.black),
                ),
                _smallSpace,
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",textAlign: TextAlign.justify,),
                _mediumSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.add_circle),
                      onPressed: null,
                    ),
                    SizedBox(width: 15,),
                    Text("1",style: TextStyle(color: Colors.black,fontSize: 16),),
                    SizedBox(width: 15,),
                    IconButton(
                      icon: Icon(Icons.remove_circle),
                      onPressed: null,
                    ),
                  ],
                ),
                _largeSpace,
                Button(btnTxt: "Add To Cart",),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
