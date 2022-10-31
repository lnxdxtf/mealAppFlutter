import 'package:flutter/material.dart';
import 'package:mealapp/src/models/category.dart';
import 'package:mealapp/src/routes/app_routes.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category, {super.key});

  void _selectCategoryScreen(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.categoriesMeals,
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategoryScreen(context),
      borderRadius: BorderRadius.circular(14),
      splashColor: Theme.of(context).colorScheme.secondary,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: LinearGradient(
                colors: [category.color.withOpacity(0.7), category.color],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight)),
        child:
            Text(category.title, style: Theme.of(context).textTheme.headline1),
      ),
    );
  }
}
