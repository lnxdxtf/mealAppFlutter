import 'package:flutter/material.dart';
import 'package:mealapp/components/meal_item.dart';
import 'package:mealapp/src/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favMeals;

  const FavoriteScreen(this.favMeals, {super.key});

  @override
  Widget build(BuildContext context) {
    if (favMeals.isEmpty) {
      return const Center(
        child: Text('NO FAV'),
      );
    } else {
      return ListView.builder(
        itemCount: favMeals.length,
        itemBuilder: (ctx, index) => MealItem(favMeals[index]),
      );
    }
  }
}
