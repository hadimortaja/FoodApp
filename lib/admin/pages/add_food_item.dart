import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/button.dart';
class AddFoodItem extends StatefulWidget {
  @override
  _AddFoodItemState createState() => _AddFoodItemState();
}

class _AddFoodItemState extends State<AddFoodItem> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 60,horizontal: 16),
          width:MediaQuery.of(context).size.width ,
        height: MediaQuery.of(context).size.height ,
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                    width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                  ),
                ),
                _buildTextFormField("Food Title",),
                _buildTextFormField("Category",),
                _buildTextFormField("Description",maxLine: 5),
                _buildTextFormField("Price",),
                _buildTextFormField("Discount",),
                SizedBox(height: 30,),
                Button(btnTxt: "Add Food Item",)

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
    );
  }
}
