
import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';

class categoriescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: GridView(
          padding: EdgeInsets.all(15),
          children: DUMMY_CATEGORIES.map((catdata) =>
              Category_item(catdata.id, catdata.title, catdata.color),
              ).toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10)),
    );
  }
}
