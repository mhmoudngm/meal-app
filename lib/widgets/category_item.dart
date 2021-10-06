import 'package:flutter/material.dart';
import '../screens/categorymealscreen.dart';
class Category_item extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  Category_item(this.id,  this.title,  this.color);
  void selectscreen(BuildContext ctx)
  {
    Navigator.of(ctx).pushNamed(
      's1',
      arguments: {
        'id': id,
        'title':title,
      }
    );
  }

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {selectscreen(context);},
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title,style: TextStyle(fontSize: 21,
            fontWeight: FontWeight.bold,
            fontFamily: "RobotoCondensed"),),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(.3), color],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
