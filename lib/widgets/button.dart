import 'package:flutter/material.dart';
class Button extends StatelessWidget {
  final String btnTxt;

  const Button({Key key, this.btnTxt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Text(btnTxt,style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
