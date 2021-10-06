import 'package:flutter/material.dart';
import 'package:meal_app/modal/meals.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favourit_screen.dart';
import 'package:meal_app/widgets/customdrawer.dart';

class tabs_screen extends StatefulWidget {
  @override
  final List<Meal> favouritemeal ;

  const tabs_screen({required this.favouritemeal});
  _tabs_screebState createState() => _tabs_screebState();
}

class _tabs_screebState extends State<tabs_screen> {
   late List<Map<String, Object>> pages ;
initState(){
  pages =[
    {'page': categoriescreen(), 'title': "Category"},
    {
      'page': favourit_screen(favouritemeal: widget.favouritemeal),
      'title': "My Favorites",
    }
  ];
  super.initState();
}

  int selectedindex = 0;
  void selectpage(int value) {
    setState(() {
      selectedindex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedindex]['title'] as String),
      ),
      body: pages[selectedindex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectpage,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black,
        currentIndex: selectedindex,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Category"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text("Favorite"),
          )
        ],
      ),
      drawer: customdrawer(),
    );
  }
}
