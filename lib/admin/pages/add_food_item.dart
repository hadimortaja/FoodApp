import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food_model.dart';
import 'package:food_delivery_app/scoped-model/main_model.dart';
import 'package:food_delivery_app/widgets/button.dart';
import 'package:scoped_model/scoped_model.dart';
class AddFoodItem extends StatefulWidget {
  @override
  _AddFoodItemState createState() => _AddFoodItemState();
}

class _AddFoodItemState extends State<AddFoodItem> {
String title;
String category;
String description;
String price;
String discount;

GlobalKey<FormState>_foodItemFormKey =GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 60,horizontal: 16),
          width:MediaQuery.of(context).size.width ,
        height: MediaQuery.of(context).size.height ,
        child: SingleChildScrollView(
          child: Form(
            key: _foodItemFormKey,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                    width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/noimage.png"),
                    ),
                      borderRadius: BorderRadius.circular(10),
                  ),
                ),
                _buildTextFormField("Food Title",),
                _buildTextFormField("Category",),
                _buildTextFormField("Description",maxLine: 5),
                _buildTextFormField("Price",),
                _buildTextFormField("Discount",),
                SizedBox(height: 30,),
                ScopedModelDescendant(
                  builder: (BuildContext context ,Widget child ,MainModel model){
                    return  GestureDetector(
                        onTap: () {
                          if (_foodItemFormKey.currentState.validate()) {
                            _foodItemFormKey.currentState.save();
                           final Food food = Food(
                              name: title,
                              category: category,
                              description: description,
                              price: double.parse(price),
                              discount: double.parse(discount),
                            );
                           model.addFood(food);
                          }
                        },
                        child: Button(
                          btnTxt: "Add Food Item",
                        ));
                  },

                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildTextFormField (String hint ,{int maxLine =1}){//alqosen m3naha enha optional
    return TextFormField(
      decoration: InputDecoration(hintText: hint),
      maxLines: maxLine,
      keyboardType: hint=="Price"|| hint =="Discount" ?TextInputType.number :TextInputType.text,
      validator: (String value) {
        var errorMsg ="";
        if (value.isEmpty && hint == "Food Title") {
          errorMsg = "The Food Title is required";
        }
        if (value.isEmpty && hint == "Description") {
          errorMsg = "The Description is required";
        }
        if (value.isEmpty && hint == "Category") {
          errorMsg = "The Category is required";
        }
        if (value.isEmpty && hint == "Price") {
          errorMsg = "The Price is required";
        }
        return errorMsg;
      },
      onChanged: (String value){
        if(hint == "Food Title"){
          title =value;
        }
        if(hint == "Category"){
          category =value;
        }
        if(hint == "Description"){
          description =value;
        }
        if(hint == "Price"){
          price =value;
        }
        if(hint == "Discount"){
          discount =value;
        }
      },
    );
  }
}
