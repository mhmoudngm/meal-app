import 'package:flutter/material.dart';
import 'package:meal_app/modal/meals.dart';
import 'package:meal_app/widgets/mealsitems.dart';
class favourit_screen extends StatelessWidget {
  final List<Meal> favouritemeal;

  const favourit_screen({required this.favouritemeal});
  @override
  Widget build(BuildContext context) {
    if(favouritemeal.isEmpty)
    {
      return Center(
      child: Text("you have no favorites yet ... start adding some!"),
    );
    }
    else
    {
      return ListView.builder(
          itemBuilder: (ctx,index){
            return Mealsitems(
                imageurl: favouritemeal[index].imageUrl,
              title:favouritemeal[index].title ,
              duration: favouritemeal[index].duration,
              affordability: favouritemeal[index].affordability,
              complexity: favouritemeal[index].complexity,
              id: favouritemeal[index].id,
             
            );

          },
          itemCount: favouritemeal.length ,
      );
    }
    
  }
}
