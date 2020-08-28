import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food_model.dart';
import 'package:food_delivery_app/scoped-model/main_model.dart';
import 'package:food_delivery_app/widgets/food_item_card.dart';
import 'package:food_delivery_app/widgets/small_button.dart';
import 'package:scoped_model/scoped_model.dart';
class ExplorePage extends StatefulWidget {
  final MainModel model;

  const ExplorePage({ this.model});
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.model.fetchFoods();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModelDescendant<MainModel>(builder: (BuildContext context, Widget child, MainModel model) {
         // model.fetchFoods();//this will fetch an notifyListeners
          List<Food>foods = model.foods;
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: RefreshIndicator(
              onRefresh: model.fetchFoods,
              child: ListView(
                children: foods.map((Food food) {
                  return FoodItemCard(
                    food.name,
                    food.description,
                    food.price.toString(),
                  );
                }).toList(),
              ),
            ),
          );
        },
      )
    );


  }
}
//Container
//(
//color: Colors.white,padding: EdgeInsets.symmetric(horizontal: 16
//)
//,
//child:ScopedModelDescendant<MainModel>
//(
//builder: (
//
//BuildContext context, Widget
//child,
//
//MainModel model
//){
//model.fetchFoods();
//List<Food>foods =model.foods;
//return Column(
//crossAxisAlignment: CrossAxisAlignment.start,
//children:foods.map((Food food){
//return FoodItemCard(
//food.name,
//food.description,
//food.price.toString(),
//);
//}).toList(),
//);
//},
//)
//)
//,