import 'dart:convert';

import 'package:food_delivery_app/models/food_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

class FoodModel extends Model {
  List<Food> _foods = [];

  List<Food> get foods {
    return List.from(_foods);
  }

  void addFood(Food food) async{
//    _foods.add(food);
  final Map<String,dynamic>foodData ={
    "title":food.name,
    "description":food.description,
    "category":food.category,
    "price":food.price,
    "discount":food.discount
  };
 final http.Response response = await http.post("https://fooddelivery-fce10.firebaseio.com/foods.json",body: json.encode(foodData));
 final Map<String,dynamic> responseData= json.decode(response.body);
// print(responseData["name"]);
  Food foodWithId =Food(
    id: responseData["name"],
    name: food.name,
    description: food.description,
    category: food.category,
    discount: food.discount,
    price: food.price
  );
  _foods.add(foodWithId);
  print(_foods[0].discount);

  }

  void fetchFoods() {
    http.get("https://fooddelivery-fce10.firebaseio.com/foods.json").then((http.Response response) {
      //  print("Fetching Data : ${response.body}");
        final List fetchedData = json.decode(response.body);
        print(fetchedData);

//        final List<Food> fetchedFoodItems =[];
        
        //print(fetchedData);
//        fetchedData.forEach((data) {
//          Food food =Food(
//            id: data["id"],
//            category: data["category_id"],
//            discount: double.parse(data["discount"]),
//            imagePath: data["image_path"],
//            name: data["title"],
//            price: double.parse(data["price"]),
//          );
//          fetchedFoodItems.add(food);
//         });
//         _foods =fetchedFoodItems;

    });
  }
}
