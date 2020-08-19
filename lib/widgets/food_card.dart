import 'package:flutter/material.dart';
class FoodCard extends StatelessWidget {
  final String categoryName;
  final String imagePath;
  final int NoOfItems;

  const FoodCard({Key key, this.categoryName, this.imagePath, this.NoOfItems}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Row(
            children: [
              Image(
                image: AssetImage(imagePath),
                height: 65,
                width: 65,
              ),
              SizedBox(width: 20,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(categoryName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  Text(NoOfItems.toString()+ " Kinds"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

