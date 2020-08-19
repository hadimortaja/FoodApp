import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/food_card.dart';
import 'package:food_delivery_app/models/category_model.dart';
import 'package:food_delivery_app/data/category_data.dart';
import 'food_card.dart';

class FoodCategory extends StatelessWidget {
  final List<Category>_categories =categories;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
       itemCount: _categories.length,
        itemBuilder: (BuildContext context,index){
          return FoodCard(
             categoryName: _categories[index].categoryName,
            imagePath: _categories[index].imagePath,
            NoOfItems: _categories[index].NoOfItems,
          );
        },
      ),
    );
  }
}
