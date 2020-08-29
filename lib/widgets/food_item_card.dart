import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/small_button.dart';
class FoodItemCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;

  const FoodItemCard( this.title, this.description, this.price);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: 120,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                blurRadius: 3, offset: Offset(0, 3), color: Colors.black12),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/breakfast.png"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "$title",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: 200,
                  child: Text("$description ")),
              SizedBox(
                height: 9,
              ),
              Container(
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,//
                  children: <Widget>[
                    Text(
                      "\u{20B5} $price",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    SmallButton(
                      btnTxt: "Buy",
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
