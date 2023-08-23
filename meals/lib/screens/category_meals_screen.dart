import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/utils/app_routes.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments == null
        ? const Category(
            id: 'c0',
            title: 'Italiano',
            color: Colors.purple,
          )
        : ModalRoute.of(context)!.settings.arguments as Category;
    final meal = dummyMeals
        .where((element) => element.categories.contains(category.id))
        .toList();
    if (category.id == "c0") {
      return CategoriesScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: meal.length,
        itemBuilder: (ctx, index) {
          return MealItem(meal: meal[index]);
        },
      ),
    );
  }
}
