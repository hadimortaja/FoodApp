import 'package:flutter/material.dart';
import 'package:food_delivery_app/admin/pages/add_food_item.dart';
import 'package:food_delivery_app/pages/explore_page.dart';
import 'package:food_delivery_app/pages/order_page.dart';
import 'package:food_delivery_app/pages/profile_page.dart';
import 'package:food_delivery_app/scoped-model/food_model.dart';
import 'package:food_delivery_app/scoped-model/main_model.dart';
import '../pages/home_page.dart';
class MainScreen extends StatefulWidget {

  final MainModel model;

  const MainScreen({Key key, this.model}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTabIndex =0;

  List<Widget>pages;
  Widget currentPage;


  HomePage homePage;
  OrderPage orderPage;
  ExplorePage explorePage;
  ProfilePage profilePage;

  @override
  void initState() {
    super.initState();
//    widget.model.fetchFoods();


    //call the fetch method on food
    //widget.foodModel.fetchFoods();
    homePage =HomePage();
    orderPage =OrderPage();
    explorePage =ExplorePage(model: widget.model,);
    profilePage =ProfilePage();

    pages =[homePage,explorePage,orderPage,profilePage];
    currentPage = homePage;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text
            (currentTabIndex==0 ?"Hadi's Food":currentTabIndex==1?"All Food Items"
            :currentTabIndex==2?"Orders":"Profile",style: TextStyle(color:Colors.black,fontSize: 18,
              fontWeight: FontWeight.bold ),),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.notifications_none,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {}),
            IconButton(
                icon:_buidShoppingCart(),
                onPressed: () {}),
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              ListTile(
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context)=>AddFoodItem()));
                },
                leading: Icon(Icons.list),
                title: Text("Add Food Item",style: TextStyle(fontSize: 16),),
              )
            ],
          ),
        ),
        resizeToAvoidBottomPadding: false,
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index){
            setState(() {
              currentTabIndex = index;
              currentPage = pages[index];
            });
          },
          currentIndex: currentTabIndex,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
              title: Text("Home")
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              title: Text("Explore"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text("Orders"),
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile"),
            ),
          ],
        ),
        body: currentPage,
      ),
    );

  }
  Widget _buidShoppingCart(){
    return Stack(
      children: <Widget>[
        Icon(
          Icons.shopping_cart,
          color: Theme.of(context).primaryColor,
        ),
        Positioned(
          top: 0.0,
          right: 0.0,
          child: Container(
            height: 12.0,
            width: 12.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.red
            ),
            child: Center(
              child: Text("1",style: TextStyle(fontSize: 12,color: Colors.white),),
            ),
          ),
        )
      ],

    );
  }
}
