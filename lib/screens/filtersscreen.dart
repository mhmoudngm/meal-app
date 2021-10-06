import 'package:flutter/material.dart';
import 'package:meal_app/widgets/customdrawer.dart';

class filtersscreen extends StatefulWidget {
  final Function savefilter;
final Map<String,bool> filters;


  const filtersscreen({ required this.filters,required this.savefilter});

  @override
  _State createState() => _State();
}

class _State extends State<filtersscreen> {
  bool _Vegan = false;
  bool _Vegetarian = false;
  bool _LactoseFree = false;
  bool _GlutenFree = false;

  @override
  initState(){
   _Vegan = widget.filters['vegan'] as bool;
  _Vegetarian = widget.filters['vegetarian'] as bool;
  _LactoseFree =widget.filters['lactose'] as bool;
  _GlutenFree = widget.filters['gluten'] as bool;
  super.initState();
  }

  Widget buildswitchtile(String title, String subtitle, bool currentvalue,
      Function(bool)? updatevalue) {
    return SwitchListTile(
      value: currentvalue,
      title: Text(title,
          style: TextStyle(
            fontWeight: FontWeight.w900,
          )),
      subtitle: Text(subtitle),
      onChanged: updatevalue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filter"),
        actions: [
          IconButton(
              onPressed: () {
                final Map<String, bool> selectedfilter = {
                  'gluten': _GlutenFree,
                  'lactose': _LactoseFree,
                  'vegan': _Vegan,
                  'vegetarian': _Vegetarian,
                };
                widget.savefilter(selectedfilter);
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          Padding(padding: const EdgeInsets.all(20)),
          Container(
              child: Text("Adjust your meal seletion",
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      fontFamily: "RobotoCondensed"))),
          Expanded(
              child: ListView(
            children: [
              buildswitchtile(
                "Gluten",
                "only include Gluten meals",
                _GlutenFree,
                (newvalue) {
                  setState(
                    () {
                      _GlutenFree = newvalue;
                    },
                  );
                },
              ),
              buildswitchtile(
                "LactoseFree",
                "only include LactoseFree meals",
                _LactoseFree,
                (newvalue) {
                  setState(
                    () {
                      _LactoseFree = newvalue;
                    },
                  );
                },
              ),
              buildswitchtile(
                "Vegetarian",
                "only include Vegetarian meals",
                _Vegetarian,
                (newvalue) {
                  setState(
                    () {
                      _Vegetarian = newvalue;
                    },
                  );
                },
              ),
              buildswitchtile(
                "Vegan",
                "only include Vegan meals",
                _Vegan,
                (newvalue) {
                  setState(
                    () {
                      _Vegan = newvalue;
                    },
                  );
                },
              ),
            ],
          ))
        ],
      ),
      drawer: customdrawer(),
    );
  }
}
