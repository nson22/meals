import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class CategoryMealScreen extends StatelessWidget {
  const CategoryMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(category.title),
      ),
      body: Center(
        child: Text("Tela de receitas de refeições ${category.title}"),
      ),
    );
  }
}
