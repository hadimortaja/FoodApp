import 'package:flutter/material.dart';
class HomeTopInfo extends StatelessWidget {
  final textStyle = TextStyle(fontSize: 32,fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("What would",style: textStyle,),
              Text("you like to eat?",style: textStyle,),
            ],
          ),
        ],
      ),
    );
  }
}
