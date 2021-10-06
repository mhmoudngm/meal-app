import 'package:flutter/material.dart';
import 'package:meal_app/modal/meals.dart';
import '../dummy_data.dart';
import '../widgets/mealsitems.dart';

class Categorymealscreen extends StatefulWidget {
final List<Meal> avaliablemeal;

  const Categorymealscreen({required this.avaliablemeal});



  @override
  _CategorymealscreenState createState() => _CategorymealscreenState();
}

class _CategorymealscreenState extends State<Categorymealscreen> {
   late List<Meal> displaymeal;
    late String categorytitle;
  @override
  void didChangeDependencies() {
        
    final  routearg = ModalRoute.of(context)!.settings.arguments as Map<String,String>;
    final categoryid = routearg['id'] as String;
     categorytitle = routearg['title'] as String;
     displaymeal = widget.avaliablemeal.where((meal) {
      return meal.categories.contains(categoryid);
    }).toList();
    super.didChangeDependencies();
  }
  
  
  
  void removeitem(String mealid)
  {
    setState(() {
      displaymeal.removeWhere((element) => element.id == mealid);
      
    });

  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text(categorytitle),),
      body: ListView.builder(
          itemBuilder: (ctx,index){
            return Mealsitems(
                imageurl: displaymeal[index].imageUrl,
              title:displaymeal[index].title ,
              duration: displaymeal[index].duration,
              affordability: displaymeal[index].affordability,
              complexity: displaymeal[index].complexity,
              id: displaymeal[index].id,
             
            );

          },
          itemCount: displaymeal.length ,
      )
    );
  }
}
