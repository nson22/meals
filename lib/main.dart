import 'package:flutter/material.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/meals_details_screen.dart';
import 'package:meals/utils/app_routes.dart';

void main() {
  runApp(const Meals());
}

class Meals extends StatelessWidget {
  const Meals({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Raleway",
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontFamily: "RobotoCondensed",
                fontSize: 20,
              ),
            ),
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
              iconTheme: const IconThemeData(
                color: Colors.white, //change your color here
              ),
              centerTitle: true,
              backgroundColor: Theme.of(context).colorScheme.primary,
              titleTextStyle: const TextStyle(
                fontFamily: "Raleway",
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
        useMaterial3: true,
      ),
      routes: {
        AppRoutes.home: (context) => const CategoriesScreen(),
        AppRoutes.categoryMeal: (context) => const CategoryMealScreen(),
        AppRoutes.mealDetails: (context) => const MealDetailScreen(),
      },
    );
  }
}
