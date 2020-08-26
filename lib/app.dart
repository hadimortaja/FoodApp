import 'package:flutter/material.dart';
import 'package:food_delivery_app/admin/pages/add_food_item.dart';
import 'package:food_delivery_app/scoped-model/food_model.dart';
import 'package:food_delivery_app/scoped-model/main_model.dart';
import 'package:food_delivery_app/screens/main_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class App extends StatelessWidget {
  final MainModel mainModel =MainModel();
  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: mainModel,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Food Dilevery App",
        theme: ThemeData(primaryColor: Colors.blueAccent),
        home: MainScreen(model:mainModel),
//      home: AddFoodItem(),
      ),
    );
  }
}
