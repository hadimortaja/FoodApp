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
    widget.model.fetchFoods();


    //call the fetch method on food
    //widget.foodModel.fetchFoods();
    homePage =HomePage();
    orderPage =OrderPage();
    explorePage =ExplorePage();
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
}
