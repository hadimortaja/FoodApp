import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/signin_page.dart';
import 'package:food_delivery_app/widgets/order_card.dart';
class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            OrderCard(),
            OrderCard(),
            OrderCard(),
          ],
      ),
      bottomNavigationBar:_buildTotalContainer(),

    );

  }

  Widget _buildTotalContainer(){
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 220,
        margin: EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Cart Total",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey),),
              Text("22.0",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),),
            ],
          ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Discount",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey),),
                Text("3.0",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Tax",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey),),
                Text("0.50",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),),
              ],
            ),
            Divider(height: 40.0,color: Color(0xFFD3D3D3)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Subtotal",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey),),
                Text("26.50",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),),            ],
            ),
            SizedBox(height: 20,),
            
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>SignInPage()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius:BorderRadius.circular(30.0),
                ),
                child: Center(
                  child: Text(
                    "Proceed to Checkout",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
