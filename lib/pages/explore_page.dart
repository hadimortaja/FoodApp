import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/admin/pages/add_food_item.dart';
import 'package:food_delivery_app/models/food_model.dart';
import 'package:food_delivery_app/scoped-model/main_model.dart';
import 'package:food_delivery_app/widgets/food_item_card.dart';
import 'package:food_delivery_app/widgets/show_dialog.dart';
import 'package:food_delivery_app/widgets/small_button.dart';
import 'package:scoped_model/scoped_model.dart';
class ExplorePage extends StatefulWidget {
  final MainModel model;

  const ExplorePage({ this.model});
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  GlobalKey<ScaffoldState>_explorePageScaffoldKey =GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.model.fetchFoods();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _explorePageScaffoldKey,
      body: ScopedModelDescendant<MainModel>(builder: (BuildContext sctx, Widget child, MainModel model) {
         // model.fetchFoods();//this will fetch an notifyListeners
          //List<Food>foods = model.foods;
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: RefreshIndicator(
              onRefresh: model.fetchFoods,
              child: ListView.builder(
                itemCount: model.foodLength,
                itemBuilder: (BuildContext lctx,int index ){
                  return GestureDetector(
                    onTap: () async{
                      final bool response = await Navigator.of(context).
                      push(MaterialPageRoute(builder: (BuildContext mctx) =>
                          AddFoodItem(
                            food: model.foods[index],
                          ))
                      );
                      if(response){
                        SnackBar snackBar =SnackBar(
                          duration: Duration(seconds: 2),
                          backgroundColor: Theme.of(context).primaryColor,
                          content: Text("Food Item Successfully Updated.",style: TextStyle(color: Colors.white,fontSize: 16),),
                        );
                        _explorePageScaffoldKey.currentState.showSnackBar(snackBar);
                      }
                    },
                    onDoubleTap:(){
                      //delete food Item
                      showLoadingIndicator(context, "Deleting Food Item...");
                      model.deleteFood(model.foods[index].id).then((bool response){
                        Navigator.of(context).pop();

                      });
                      },
                    child: FoodItemCard(
                    model.foods[index].name,
                    model.foods[index].description,
                    model.foods[index].price.toString(),

                    ),
                  );
                },

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