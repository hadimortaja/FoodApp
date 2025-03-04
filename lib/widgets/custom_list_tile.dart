import 'package:flutter/material.dart';
class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String text;

  const CustomListTile({Key key, this.icon, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: <Widget>[
          Icon(icon,color: Colors.blue,),
          SizedBox(width: 15,),
          Text(text,style: TextStyle(fontSize: 16),),
        ],
      ),
    );
  }
}
