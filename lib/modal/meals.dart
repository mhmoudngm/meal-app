import 'package:flutter/material.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard
}
enum Affordability {
  Affordable,
  Pricey,
  Luxurious
}

class Meal {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final List<String> steps;
  final List<String> ingredients;
  final List<String> categories;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;
  final bool isGlutenFree;

 const Meal({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.steps,
    required this.categories,
    required this.ingredients,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,

  });
}
