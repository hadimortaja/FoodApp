import 'package:flutter/material.dart';
class SmallButton extends StatelessWidget {
  final String btnTxt;

  const SmallButton({Key key, this.btnTxt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 25,
      width: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: Colors.blue
          )
      ),
      child: Center(child: Text(btnTxt,style: TextStyle(color: Colors.blue,fontSize: 16),)),
    );
  }
}
