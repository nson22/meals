import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/main.dart';
import 'package:patrol_finders/patrol_finders.dart';

void main() {

  patrolWidgetTest(
    'CT01-verificar_listagem_das_categorias',
    (PatrolTester $) async {
      await $.pumpWidgetAndSettle(const MyApp());

      expect($("Lista de Categorias").exists, equals(true));

      for (var categoria in dummyCategories) {
        expect($(categoria.title).exists, equals(true));  
      }

    },
  );

  patrolWidgetTest('CT02-verificar_a_apresentação_da_listagem_de_categoria_através_da_tela_de_favoritos',
    (PatrolTester $) async {
      await $.pumpWidgetAndSettle(const MyApp());

      expect($("Lista de Categorias").exists, equals(true));

      expect($("Favoritos").exists, equals(true));  

      await $('Favoritos').tap();

      expect($("Meus Favoritos").exists, equals(true));  

      await $('Categorias').tap();

      for (var categoria in dummyCategories) {
        expect($(categoria.title).exists, equals(true));  
      }
    },
  );

  patrolWidgetTest('CT03-verificar_listagem_das_categorias_via_menur_refeições',
    (PatrolTester $) async {
      await $.pumpWidgetAndSettle(const MyApp());

      expect($("Lista de Categorias").exists, equals(true));

      final ScaffoldState state = $.tester.firstState($(Scaffold));

      state.openDrawer();

      await $.pump();

      expect($("Vamos Cozinhar?").exists, equals(true));

      await $("Refeições").tap();

      expect($("Lista de Categorias").exists, equals(true));

    },
  );

  patrolWidgetTest('CT04-acessar_a_lista_de_receitas',
    (PatrolTester $) async {
      await $.pumpWidgetAndSettle(const MyApp());

      expect($("Lista de Categorias").exists, equals(true));

      await $("Italiano").tap();

      expect($("Italiano").exists, equals(true));
      expect($("Spaghetti with Tomato Sauce").exists, equals(true));
      expect($("20 min").exists, equals(true));
      expect($("Simples").exists, equals(true));
      expect($("Barato").exists, equals(true));
    },
  );

  patrolWidgetTest('CT05-acessar_o_detalhamento_da_receita',
    (PatrolTester $) async {
      await $.pumpWidgetAndSettle(const MyApp());

      expect($("Lista de Categorias").exists, equals(true));

      await $("Italiano").tap();

      expect($("Italiano").exists, equals(true));

      expect($("Spaghetti with Tomato Sauce").exists, equals(true));
      expect($("20 min").exists, equals(true));
      expect($("Simples").exists, equals(true));
      expect($("Barato").exists, equals(true));

      await $(InkWell).tap();

      expect($("Spaghetti with Tomato Sauce").exists, equals(true));
      expect($("Ingredientes").exists, equals(true));
      expect($("4 Tomatoes").exists, equals(true));
      expect($("1 Tablespoon of Olive Oil").exists, equals(true));

      expect($("1 Onion").exists, equals(true));
      expect($("Ingredientes").exists, equals(true));
      expect($("250g Spaghetti").exists, equals(true));
      expect($("Spices").exists, equals(true));
      expect($("Cheese (optional)").exists, equals(true));

      expect($("Passos").exists, equals(true));


      expect($("Cut the tomatoes and the onion into small pieces.").exists, equals(true));
      expect($("Boil some water - add salt to it once it boils.").exists, equals(true));
      expect($("Boil some water - add salt to it once it boils.").exists, equals(true));
    },
  );

}
