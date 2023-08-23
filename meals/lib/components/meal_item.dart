import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/utils/app_routes.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  const MealItem({
    Key? key,
    required this.meal,
  }) : super(key: key);

  void _selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.MEAL_DETAIL,
      arguments: meal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () => _selectMeal(context),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          //margin: const EdgeInsets.all(10),
          elevation: 4,
          child: Column(
            children: [
              Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      meal.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(children: [
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 6,
                      ),
                      Text("${meal.duration} min"),
                    ]),
                    Row(children: [
                      const Icon(Icons.work),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(meal.getComplexity),
                    ]),
                    Row(children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(meal.getCost),
                    ]),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
