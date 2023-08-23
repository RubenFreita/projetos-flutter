import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/category_meals_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/utils/app_routes.dart';

void main(List<String> args) {
  runApp(Meals());
}

class Meals extends StatelessWidget {
  Meals({Key? key}) : super(key: key);
  final ThemeData tema = ThemeData(
    fontFamily: "Raleway",
    brightness: Brightness.light,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: const CategoriesScreen(),
      theme: tema.copyWith(
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        scaffoldBackgroundColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: tema.textTheme.copyWith(
          headline6: const TextStyle(
            fontFamily: "RobotoCondensed",
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: tema.colorScheme.copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
        appBarTheme: tema.appBarTheme.copyWith(
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontFamily: "Raleway",
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      routes: {
        AppRoutes.HOME: (ctx) => const TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) => const CategoryMealsScreen(),
        AppRoutes.MEAL_DETAIL: (ctx) => const MealDetailScreen(),
      },
    );
  }
}
