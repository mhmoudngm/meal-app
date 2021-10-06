import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/modal/meals.dart';
import '../screens/categorymealscreen.dart';

class Mealsitems extends StatelessWidget {

  final String id;
  final String imageurl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const Mealsitems({
      required this.id,
      required this.imageurl,
      required this.title,
      required this.duration,
      required this.affordability,
      required this.complexity, 
     });
  String get complexityitem {
    switch(complexity) {
      case Complexity.Simple: return "Simple" ; break;
      case Complexity.Hard: return "Hard" ; break;
      case Complexity.Challenging: return "Challenging"; break;
      default: return "unknown" ; break;

    }
  }
  String get affordabilityitem {
    switch(affordability) {
      case Affordability.Affordable: return "Affordable" ; break;
      case Affordability.Luxurious: return "Luxurious" ; break;
      case Affordability.Pricey: return "Pricey"; break;
      default: return "unknown" ; break;

    }
  }

  void selectmeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('s2',
    arguments: {
       'id': id ,
    }
    ).then((result) {
    //  if (result != null)
     // removefun(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectmeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(imageurl,height: 300,width: double.infinity,fit: BoxFit.cover,),
                ),
                Positioned(
                  bottom: 20,
                    right: 10,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                      color: Colors.black54,
                      width: 300,
                        child: Text(title,style: TextStyle(color: Colors.white,fontSize: 24),softWrap: true,overflow:TextOverflow.fade ,))
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text("$duration min")
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work_rounded),
                      SizedBox(width: 6),
                      Text("$complexityitem")
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 6),
                      Text("$affordabilityitem")
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
