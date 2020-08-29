import 'package:flutter/material.dart';
import 'package:food_delivery_app/app.dart';
import 'package:food_delivery_app/models/food_model.dart';
import 'package:food_delivery_app/scoped-model/main_model.dart';
import 'package:food_delivery_app/widgets/button.dart';
import 'package:food_delivery_app/widgets/show_dialog.dart';
import 'package:scoped_model/scoped_model.dart';
class AddFoodItem extends StatefulWidget {
  final Food food;
  AddFoodItem({this.food});
  @override
  _AddFoodItemState createState() => _AddFoodItemState();
}

class _AddFoodItemState extends State<AddFoodItem> {
String title;
String category;
String description;
String price;
String discount;

GlobalKey<FormState>_foodItemFormKey =GlobalKey();
GlobalKey<ScaffoldState>_scaffoldStateKey =GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: (){
          Navigator.of(context).pop(false);
          return Future.value(false);
        },
        child: Scaffold(
          key: _scaffoldStateKey,
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            title: Text(widget.food!=null?"Update Food Item":"Add Food Item",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.close,color: Colors.black,),
              onPressed: (){
                Navigator.of(context).pop(false);
              },
            ),
          ),
          body: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16),
              width:MediaQuery.of(context).size.width ,
            height: MediaQuery.of(context).size.height ,
            child: SingleChildScrollView(
              child: Form(
                key: _foodItemFormKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                        width: MediaQuery.of(context).size.width,
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/noimage.png"),
                        ),
                          borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    _buildTextFormField("Food Title",),
                    _buildTextFormField("Category",),
                    _buildTextFormField("Description",maxLine: 5),
                    _buildTextFormField("Price",),
                    _buildTextFormField("Discount",),
                    SizedBox(height: 30,),
                    ScopedModelDescendant(
                      builder: (BuildContext context ,Widget child ,MainModel model){
                        return  GestureDetector(
                            onTap: () {
                              onSubmit(model.addFood,model.updateFood);
                              if(model.isLoading){
                                //show progress
                                showLoadingIndicator(context,widget.food!=null?"Updating Food...":"Adding Food...");
                              }
                            },
                            child: Button(
                              btnTxt:widget.food!=null?"Update Food Item": "Add Food Item",
                            ));
                      },

                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  void onSubmit(Function addFood,Function updateFood)async{
    if (_foodItemFormKey.currentState.validate()) {
      _foodItemFormKey.currentState.save();

     if(widget.food!=null){
        //bde a3adel 3lehom
       Map<String,dynamic>updatedFoodItem ={
         "title":title,
         "category":category,
         "description":description,
         "price":double.parse(price),
         "discount":discount!=null? double.parse(discount):0.0,
         "foodId":widget.food.id,
       };
     final bool response =await  updateFood(updatedFoodItem,widget.food.id);

     if(response){
       Navigator.of(context).pop();//remove the alert dialog
       Navigator.of(context).pop(response);//remove the previous page

     }else if(!response){
       Navigator.of(context).pop();
       SnackBar snackBar =SnackBar(
         duration: Duration(seconds: 2),
         backgroundColor: Colors.red,
         content: Text("Failed to Update Food Item."),
       );
       _scaffoldStateKey.currentState.showSnackBar(snackBar);
     }

      }else if(widget.food==null){
        //bde adef han
        final Food food = Food(
         name: title,
         category: category,
         description: description,
         price: double.parse(price),
         discount: double.parse(discount),
       );
       bool value = await addFood(food);
       if(value){
         Navigator.of(context).pop();
         SnackBar snackBar =SnackBar(
           content: Text("Food Item Successfully Added."),
         );
         _scaffoldStateKey.currentState.showSnackBar(snackBar);
       }else if(!value){
         Navigator.of(context).pop();
         SnackBar snackBar =SnackBar(
           content: Text("Failed to Add Food Item."),
         );
         _scaffoldStateKey.currentState.showSnackBar(snackBar);
       }
     }
    }
  }

  Widget _buildTextFormField (String hint ,{int maxLine =1}){//alqosen m3naha enha optional
    return TextFormField(
      initialValue: widget.food!=null&&hint=="Food Title"?widget.food.name:
      widget.food!=null&&hint=="Description"?widget.food.description:
      widget.food!=null&&hint=="Category"?widget.food.category:
      widget.food!=null&&hint =="Price"?widget.food.price.toString():
      widget.food!=null&&hint =="Discount"?widget.food.discount.toString():
      "",
      decoration: InputDecoration(hintText: hint),
      maxLines: maxLine,
      keyboardType: hint=="Price"|| hint =="Discount" ?TextInputType.number :TextInputType.text,
      validator: (String value) {

        if (value.isEmpty && hint == "Food Title") {
          return  "The Food Title is required";
        }
        if (value.isEmpty && hint == "Description") {
          return "The Description is required";
        }
        if (value.isEmpty && hint == "Category") {
          return "The Category is required";
        }
        if (value.isEmpty && hint == "Price") {
          return "The Price is required";
        }
//        return "";
      },
      onSaved: (String value){
        if(hint == "Food Title"){
          title =value;
        }
        if(hint == "Category"){
          category =value;
        }
        if(hint == "Description"){
          description =value;
        }
        if(hint == "Price"){
          price =value;
        }
        if(hint == "Discount"){
          discount =value;
        }
      },
    );
  }
  Widget _buildCategoryTextFormField(){
    return TextFormField();
  }
}
