import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screens/category_meals_screen.dart';
import 'package:meals/utils/app_routes.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem({
    required this.category,
    Key? key,
  }) : super(key: key);

  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.CATEGORIES_MEALS,
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectCategory(context);
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          color: category.color,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
