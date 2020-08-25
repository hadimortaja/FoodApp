import 'dart:convert';

import 'package:food_delivery_app/models/food_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

class FoodModel extends Model {
  List<Food> _foods = [];

  List<Food> get foods {
    return List.from(_foods);
  }

  void addFood(Food food) {
    _foods.add(food);
  }

  void fetchFoods() {
    http.get("http://localhost/flutter_food_app/api/foods/getfoods.php").then((http.Response response) {
//      http://192.168.1.10/flutter_food_app/api/foods/getfoods.php
      //  print("Fetching Data : ${response.body}");
        final List fetchedData = json.decode(response.body);
        final List<Food> fetchedFoodItems =[];
        
        //print(fetchedData);
        fetchedData.forEach((data) {
          Food food =Food(
            id: data["id"],
            category: data["category_id"],
            discount: double.parse(data["discount"]),
            imagePath: data["image_path"],
            name: data["title"],
            price: double.parse(data["price"]),
          );
          fetchedFoodItems.add(food);
         });
         _foods =fetchedFoodItems;

    });
  }
}
