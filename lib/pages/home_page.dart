import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/food_data.dart';
import 'package:food_delivery_app/models/food_model.dart';
import 'package:food_delivery_app/widgets/bought_foods.dart';
import 'package:food_delivery_app/widgets/food_category.dart';
import 'package:food_delivery_app/widgets/home_top_info.dart';
import 'package:food_delivery_app/widgets/search_field.dart';

import '../models/food_model.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  List<Food> _foods =foods;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 50,left: 20,right: 20),
        children: <Widget>[
          HomeTopInfo(),
          FoodCategory(),
          SizedBox(height: 20,),
          SearchField(),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Frequently Bought Foods",
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: (){},
                child: Text("View All",style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.orangeAccent
                ),),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Column(
            children: _foods.map(_buildFoodItems).toList(),

          ),
        ],
      ),

    );

  }
  Widget _buildFoodItems(Food food){
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: BoughtFoods(
        id: food.id,
        imagePath: food.imagePath,
        category: food.category,
        discount: food.discount,
        name: food.name,
        price: food.price,
        ratings: food.ratings,
      ),

    );
  }
}
