import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealapp/screens/meal_detail_screen.dart';
import 'package:mealapp/screens/settings_screen.dart';
import 'package:mealapp/src/models/settings.dart';
import 'package:mealapp/themes/themes.dart';
import 'package:mealapp/screens/categories_meals_screen.dart';
import 'package:mealapp/src/routes/app_routes.dart';
import 'package:mealapp/screens/tabs_screen.dart';
import 'package:mealapp/src/data/dummy_data.dart';
import 'package:mealapp/src/models/meal.dart';

class MealApp extends StatefulWidget {
  const MealApp({super.key});

  @override
  State<MealApp> createState() => _MealAppState();
}

class _MealAppState extends State<MealApp> {
  List<Meal> _availableMeal = dummyMeals;
  List<Meal> _favMeals = [];

  Settings settings = Settings();
  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeal = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterVegan &&
            !filterVegetarian &&
            !filterLactose;
      }).toList();
    });
  }

  void _toggleFav(Meal mealFav) {
    setState(() {
      _favMeals.contains(mealFav)
          ? _favMeals.remove(mealFav)
          : _favMeals.add(mealFav);
    });
  }

  bool _isFav(Meal meal) {
    return _favMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: thm1.copyWith(
        canvasColor: const Color.fromRGBO(255, 241, 212, 1),
        colorScheme: thm1.colorScheme.copyWith(
            primary: Colors.red.shade500,
            secondary: Colors.teal.shade400,
            tertiary: Colors.amber),
        textTheme: thm1.textTheme.copyWith(
            headline1: GoogleFonts.raleway(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            headline2: GoogleFonts.kalam(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
            ),
            headline3: GoogleFonts.kalam(
              fontSize: 16,
              color: Colors.amber.shade800,
            )),
        appBarTheme: thm1.appBarTheme.copyWith(),
      ),
      routes: {
        AppRoutes.home: (ctx) => TabsScreen(_favMeals),
        AppRoutes.categoriesMeals: (ctx) =>
            CategoriesMealsScreen(_availableMeal),
        AppRoutes.mealDetail: (ctx) => MealDetailScreen(_toggleFav, _isFav),
        AppRoutes.settings: (ctx) => SettingsScreen(settings, _filterMeals),
      },
      // onGenerateRoute: (settings) {

      // },
      // onUnknownRoute: (settings) {

      // },
    );
  }
}
