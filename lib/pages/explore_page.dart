import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food_model.dart';
import 'package:food_delivery_app/scoped-model/main_model.dart';
import 'package:food_delivery_app/widgets/food_item_card.dart';
import 'package:food_delivery_app/widgets/small_button.dart';
import 'package:scoped_model/scoped_model.dart';
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
        child:ScopedModelDescendant<MainModel>(
          builder: (BuildContext context,Widget child,MainModel model){
            model.fetchFoods();
            List<Food>foods =model.foods;
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:foods.map((Food food){
                  return FoodItemCard(
                      food.name,
                      food.description,
                      food.price.toString(),
                  );
                }).toList(),
              );
            },
        )
      ),
    );
  }
}
