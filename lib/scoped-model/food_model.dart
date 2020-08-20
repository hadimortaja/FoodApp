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
    http.get("http://192.168.56.1/flutter_food_app/api/foods/getfoods.php").then((http.Response response) {
        print("Fetching Data : ${response.body}");
    });
  }
}
