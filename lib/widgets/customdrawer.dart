import 'package:flutter/material.dart';
import 'package:meal_app/screens/tabs_screen.dart';

class customdrawer extends StatelessWidget {
  
  Widget buildlisttitle(String titile,IconData icon, Function()? taphandler)
  {
    return ListTile(
            leading: Icon(icon),
            title:Text (titile,style: 
            TextStyle(
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.w700,
              fontSize: 24
            ),
            ),
            onTap: taphandler,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            child: Text("Cooking Up!",
            style: TextStyle(
              fontSize:30,
              fontWeight:FontWeight.w900,
              color: Theme.of(context).primaryColor
            ),
            ),
          ),
          const SizedBox(height: 20,),
          buildlisttitle("Meal", Icons.restaurant,(){Navigator.of(context).pushReplacementNamed('/');}),
          buildlisttitle("Filters", Icons.settings,(){Navigator.of(context).pushReplacementNamed('/filter');})
        ]
)

        
      
    );
  }
}