import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/modal/meals.dart';
import '../widgets/mealsitems.dart';
import 'package:meal_app/dummy_data.dart';

class Meal_details_screen extends StatelessWidget {
  final Function tagglefavourit;
  final Function ismealfavourit;

  const Meal_details_screen({required this.tagglefavourit,required this.ismealfavourit});
  @override
  Widget build(BuildContext context) {
    final  mealid = ModalRoute.of(context)!.settings.arguments as Map<String,Object>;
    final selectedmeal = DUMMY_MEALS.firstWhere((meal) {
      return meal.id  == mealid['id'] as String;
    } ,
    );
    return Scaffold(
      appBar: AppBar(title: Text(selectedmeal.title),),
      body: ListView(


        children: [
          Container(
            width: double.infinity,
            height: 300,
            child: Image.network(selectedmeal.imageUrl,fit: BoxFit.cover,),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text("Ingredients",style: TextStyle(fontSize: 21,
            fontWeight: FontWeight.bold,
            fontFamily: "RobotoCondensed")),
          ),
          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(10),
            width: 300,
            height: 150,
            decoration: BoxDecoration(
                color: Colors.black12,
                border: Border.all(color: Colors.pinkAccent),
                borderRadius: BorderRadius.circular(15)
            ),
            child: ListView.builder(
              itemBuilder: (context,index) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                  ),
                  elevation: 10,

                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 7,horizontal: 10),
                    child: Text(selectedmeal.ingredients[index]),
                  ),
                );

              },
              itemCount: selectedmeal.ingredients.length,
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text("Steps",style: TextStyle(fontSize: 21,
            fontWeight: FontWeight.bold,
            fontFamily: "RobotoCondensed")),
          ),
          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(15),
            width: 300,
            height: 150,
            decoration: BoxDecoration(
                color: Colors.black12,
                border: Border.all(color: Colors.pinkAccent),
                borderRadius: BorderRadius.circular(15)
            ),
            child: ListView.builder(
              itemBuilder: (context,index) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                  ),
                  elevation: 10,
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 7,horizontal: 10),
                    child: Text(selectedmeal.steps[index]),
                  ),
                );

              },
              itemCount: selectedmeal.steps.length,
            ),
          )

        ],
      ),
    
    floatingActionButton: FloatingActionButton(
      onPressed: ()=>tagglefavourit(mealid['id']),
      child: Icon(
        ismealfavourit(mealid['id']) ? Icons.star:Icons.star_border
      
      ),
    ));
  }
}
