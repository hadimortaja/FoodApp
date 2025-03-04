import 'dart:convert';
import 'package:food_delivery_app/models/food_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

class FoodModel extends Model {
  List<Food> _foods = [];
  bool _isLoading = false;

  bool get isLoading{
    return _isLoading;
  }

  List<Food> get foods {
    return List.from(_foods);
  }
  int get foodLength{
    return _foods.length;
  }

  Future <bool> addFood(Food food) async{
    _isLoading =true;
    notifyListeners();
try{
  //    _foods.add(food);
  final Map<String,dynamic>foodData ={
    "title":food.name,
    "description":food.description,
    "category":food.category,
    "price":food.price,
    "discount":food.discount
  };
  final http.Response response = await http.post("https://fooddelivery-fce10.firebaseio.com/foods.json",
      body: json.encode(foodData));
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
  _isLoading =false;
  notifyListeners();
//  fetchFoods();
      return Future.value(true);
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return Future.value(false);

      //print("Connection Error : $e");
    }
  }

  Future<bool> fetchFoods() async{
    _isLoading =true;
    notifyListeners();
  try{
    final http.Response response =await http.get("https://fooddelivery-fce10.firebaseio.com/foods.json");
    //  print("Fetching Data : ${response.body}");
    final Map<String, dynamic> fetchedData = json.decode(response.body);
    print(fetchedData);

    final List<Food> foodItems = [];

    fetchedData.forEach((String id, dynamic foodData) {
      Food foodItem = Food(
          id: id,
          name: foodData["title"],
          description: foodData["description"],
          category: foodData["category"],
          price: double.parse(foodData["price"].toString()),
          discount: double.parse(foodData["discount"].toString()));
      foodItems.add(foodItem);
    });
    _foods = foodItems;
    _isLoading =false;
    notifyListeners();
    return Future.value(true);
  }catch(error){
    _isLoading =false;
    notifyListeners();
    return Future.value(false);
  }
  }
  Future<bool>updateFood(Map<String,dynamic>foodData,String foodId)async{
    _isLoading =true;
    notifyListeners();
    //get the food by id
    Food theFood =getFoodItemById(foodId);

    //get the index of the food
    int foodIndex =_foods.indexOf(theFood);
try{
await http.put("https://fooddelivery-fce10.firebaseio.com/foods/${foodId}.json",body: json.encode(foodData));

Food updateFoodItem = Food(
id: foodId,
name: foodData["title"],
  category: foodData["category"],
  discount: foodData["discount"],
  price: foodData["price"],
  description: foodData["description"],
);
_foods[foodIndex] = updateFoodItem;
_isLoading =false;
notifyListeners();
return Future.value(true);
    }catch(error){
  _isLoading =false;
  notifyListeners();
  return Future.value(false);

}
  }
  Future<bool>deleteFood(String foodId)async{
    _isLoading=true;
    notifyListeners();
    try{
     final http.Response response =await http.delete("https://fooddelivery-fce10.firebaseio.com/foods/${foodId}.json");

     _foods.removeWhere((Food food)=>food.id==foodId );
     _isLoading =false;
     notifyListeners();
     return Future.value(true);
    }catch (error){
_isLoading =false;
notifyListeners();
return Future.value(false);
    }
  }
  Food getFoodItemById(String foodId){
    Food food;
    for(int i =0;i<_foods.length;i++){
      if(_foods[i].id==foodId){
        food =_foods[i];
        break;
      }
    }
    return food;

  }
}
