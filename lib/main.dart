import 'package:flutter/material.dart';
import 'package:meal_app/modal/meals.dart';
import 'package:meal_app/screens/filtersscreen.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import 'package:meal_app/widgets/category_item.dart';
import './screens/categories_screen.dart';
import 'dummy_data.dart';
import './screens/categorymealscreen.dart';
import './screens/meal_details_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

Map<String,bool> _filters = {
  'gluten': false,
  'lactose':false,
  'vegan':false,
  'vegetarian':false,
};
List<Meal> avaliablemeal = DUMMY_MEALS;
List<Meal> favouritemeal = [];
bool ismealfavourit(String id)
{
  return favouritemeal.any((meal) => meal.id == id);
}

void tagglefavourit(String mealid)
{
  final existingindex = favouritemeal.indexWhere((meal) => meal.id == mealid);
  if(existingindex >= 0)
  {
setState(() {
 favouritemeal.removeAt(existingindex); 
});
  }
  else
  {
    favouritemeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealid));
  }
}


void setfilter(Map<String,bool> _filters_data)
{
_filters = _filters_data;
avaliablemeal = DUMMY_MEALS.where((meal) 
{
  if (_filters['gluten'] == true && meal.isGlutenFree == false)
  {
    return false;
  };
  if (_filters['lactose'] == true && meal.isLactoseFree == false)
  {
    return false;
  };
  if (_filters['vegan'] == true && meal.isVegan == false)
  {
    return false;
  };
  if (_filters['vegetarian'] == true && meal.isVegetarian == false)
  {
    return false;
  };
  return true;

}).toList();
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: MyHomePage()
      //home: tabs_screen(),
      routes: {
        '/':(context) => tabs_screen(favouritemeal: favouritemeal,),
        's1':(context) => Categorymealscreen(avaliablemeal: avaliablemeal,),
        's2':(context) => Meal_details_screen(tagglefavourit: tagglefavourit,ismealfavourit:ismealfavourit),
        '/filter': (context) => filtersscreen(savefilter: setfilter ,filters:_filters),
      },
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.orange[300],
        canvasColor: Colors.white,
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(
            color: Colors.black54
          ),
          bodyText2: TextStyle(
            color: Colors.black54
          ),

        )

      ),

    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal App"),
      ),
      body: null,
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
