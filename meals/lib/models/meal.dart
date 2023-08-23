import 'package:flutter/material.dart';

enum Complexity {
  simple,
  medium,
  difficult,
}

enum Cost {
  cheap,
  fair,
  expensive,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final Complexity complexity;
  final Cost cost;

  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.complexity,
    required this.cost,
  });

  String get getComplexity {
    switch (complexity) {
      case Complexity.simple:
        return "Simples";
      case Complexity.medium:
        return "Médio";
      case Complexity.difficult:
        return "Difícil";
      default:
        return "Desconhecido";
    }
  }

  String get getCost {
    switch (cost) {
      case Cost.fair:
        return "Justo";
      case Cost.expensive:
        return "Caro";
      case Cost.cheap:
        return "Barato";
      default:
        return "Desconhecido";
    }
  }
}
