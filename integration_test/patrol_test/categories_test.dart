import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/main.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:patrol_finders/patrol_finders.dart';

void main() {
  // patrolWidgetTest(
  //   'CT01-verificar_listagem_das_categorias',
  //   (PatrolTester $) async {
  //     await $.pumpWidgetAndSettle(const MyApp());

  //     expect($("Lista de Categorias").exists, equals(true));

  //     for (var categoria in dummyCategories) {
  //       expect($(categoria.title).exists, equals(true));
  //     }

  //   },
  // );

  // patrolWidgetTest('CT02-verificar_a_apresentação_da_listagem_de_categoria_através_da_tela_de_favoritos',
  //   (PatrolTester $) async {
  //     await $.pumpWidgetAndSettle(const MyApp());

  //     expect($("Lista de Categorias").exists, equals(true));

  //     expect($("Favoritos").exists, equals(true));

  //     await $('Favoritos').tap();

  //     expect($("Meus Favoritos").exists, equals(true));

  //     await $('Categorias').tap();

  //     for (var categoria in dummyCategories) {
  //       expect($(categoria.title).exists, equals(true));
  //     }
  //   },
  // );

  // patrolWidgetTest('CT03-verificar_listagem_das_categorias_via_menur_refeições',
  //   (PatrolTester $) async {
  //     await $.pumpWidgetAndSettle(const MyApp());

  //     expect($("Lista de Categorias").exists, equals(true));

  //     final ScaffoldState state = $.tester.firstState($(Scaffold));

  //     state.openDrawer();

  //     await $.pump();

  //     expect($("Vamos Cozinhar?").exists, equals(true));

  //     await $("Refeições").tap();

  //     expect($("Lista de Categorias").exists, equals(true));

  //   },
  // );

  // patrolWidgetTest('CT04-acessar_a_lista_de_receitas',
  //   (PatrolTester $) async {
  //     await $.pumpWidgetAndSettle(const MyApp());

  //     expect($("Lista de Categorias").exists, equals(true));

  //     await $("Italiano").tap();

  //     expect($("Italiano").exists, equals(true));
  //     expect($("Spaghetti with Tomato Sauce").exists, equals(true));
  //     expect($("20 min").exists, equals(true));
  //     expect($("Simples").exists, equals(true));
  //     expect($("Barato").exists, equals(true));
  //   },
  // );

  patrolWidgetTest(
    'CT05-acessar_o_detalhamento_da_receita',
    (PatrolTester $) async {
      await $.pumpWidgetAndSettle(const MyApp());

      expect($("Lista de Categorias").exists, equals(true));

      Category category = dummyCategories.elementAt(0);

      final mealsWithCategory =
          dummyMeals.where((meal) => meal.categories.contains(category.id));

      await $(category.title).tap();

      expect($(category.title).exists, equals(true));

      for (var meal in mealsWithCategory) {
        expect($(meal.title).exists, equals(true));
        expect($("${meal.duration}} min").exists, equals(true));
        expect($(meal.complexity.toString()).exists, equals(true));
        expect($(meal.cost.toString()).exists, equals(true));

        await $(InkWell).tap();

        expect($(meal.title).exists, equals(true));

        expect($("Ingredientes").exists, equals(true));

        for (var ingredient in meal.ingredients) {
          expect($(ingredient).exists, equals(true));
        }
        expect($("Passos").exists, equals(true));

        for (var step in meal.steps) {
          expect($(step).exists, equals(true));
        }
      }
    },
  );
}
