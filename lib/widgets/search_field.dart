import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 32,vertical: 14),
          hintText: "Search any food",
          suffixIcon: InkWell(onTap: (){},
              child: Icon(Icons.search,color: Colors.black,)),
          border: InputBorder.none
        ),
      ),
    );
  }
}
