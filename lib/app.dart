import 'package:flutter/material.dart';
import 'package:food_delivery_app/scoped-model/food_model.dart';
import 'package:food_delivery_app/screens/main_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class App extends StatelessWidget {
  final FoodModel foodModel =FoodModel();
  @override
  Widget build(BuildContext context) {
    return ScopedModel<FoodModel>(
      model: foodModel,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Food Dilevery App",
        theme: ThemeData(primaryColor: Colors.blueAccent),
        home: MainScreen(foodModel:foodModel),
      ),
    );
  }
}
