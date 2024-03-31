import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/main.dart';
import 'package:meals/models/category.dart';
import 'package:patrol_finders/patrol_finders.dart';


void main() {

  List<Category> categories = dummyCategories;

  patrolWidgetTest(
    'CT01-verificar_listagem_das_categorias',
    (PatrolTester $) async {
      await $.pumpWidgetAndSettle(const MyApp());

      expect($("Lista de Categorias").exists, equals(true));

      for (var categoria in categories) {
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

      for (var categoria in categories) {
        expect($(categoria.title).exists, equals(true));
      }
    },
  );

  patrolWidgetTest('CT03-verificar_listagem_das_categorias_via_menu_refeições',
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
      Category category = categories.elementAt(0);

      final mealsWithCategory =
          dummyMeals.where((meal) => meal.categories.contains(category.id));

      expect($("Lista de Categorias").exists, equals(true));

      await $(category.title).tap();

      for (var meal in mealsWithCategory) {
        expect($(meal.title).exists, equals(true));
        expect($("${meal.duration.toString()} min").exists, equals(true));
        expect($(meal.complexityText).exists, equals(true));
        expect($(meal.costText).exists, equals(true));
      }
    },
  );

  patrolWidgetTest(
    'CT05-acessar_o_detalhamento_da_receita',
    (PatrolTester $) async {
      Category category = categories.elementAt(0);

      await $.pumpWidgetAndSettle(const MyApp());

      expect($("Lista de Categorias").exists, equals(true));

      final mealsWithCategory =
          dummyMeals.where((meal) => meal.categories.contains(category.id));

      expect($(category.title).exists, equals(true));

      await $(category.title).tap();

      for (var meal in mealsWithCategory) {
        expect($(meal.title).exists, equals(true));
        expect($("${meal.duration.toString()} min").exists, equals(true));
        expect($(meal.complexityText).exists, equals(true));
        expect($(meal.costText).exists, equals(true));

        await $(InkWell).tap();

        expect($(meal.title).exists, equals(true));

        expect($("Ingredientes").exists, equals(true));

        for (var i = 0; i < meal.ingredients.length; i++) {
          expect($(meal.ingredients.elementAt(i)).exists, equals(true));  
        }

        expect($("Passos").exists, equals(true));

        await $("Passos").scrollTo(view: $(#mealDetail).$(Scrollable));

        for (var i = 0; i < meal.steps.length; i++) {

          if(i > 2) {
            await $(meal.steps.elementAt(i)).scrollTo(view: $(#steps).$(Scrollable));
          }

          expect($(meal.steps.elementAt(i)).exists, equals(true));  
        }
      }
    },
  );

  patrolWidgetTest(
    'CT06-adicionar_receita_aos_favoritos',
    (PatrolTester $) async {
      await $.pumpWidgetAndSettle(const MyApp());

      Category category = categories.elementAt(0);
      final mealsWithCategory =
        dummyMeals.where((meal) => meal.categories.contains(category.id));

      expect($("Lista de Categorias").exists, equals(true));

      await $(category.title).tap();

      await $(InkWell).tap();

      await $(FloatingActionButton).tap();

      await $(Icons.arrow_back).tap();

      await $(Icons.arrow_back).tap();

      await $(Icons.star).tap();

      expect($('Meus Favoritos').exists, equals(true));

      for (var meal in mealsWithCategory) {
        expect($(meal.title).exists, equals(true));
        expect($("${meal.duration.toString()} min").exists, equals(true));
        expect($(meal.complexityText).exists, equals(true));
        expect($(meal.costText).exists, equals(true));
      }
  });

   patrolWidgetTest(
    'CT07-visualizar_lista_de_favoritos',
    (PatrolTester $) async {
      await $.pumpWidgetAndSettle(const MyApp());

      Category category = categories.elementAt(0);
      final mealsWithCategory =
        dummyMeals.where((meal) => meal.categories.contains(category.id));

      expect($("Lista de Categorias").exists, equals(true));

      await $(category.title).tap();

      await $(InkWell).tap();

      await $(FloatingActionButton).tap();

      await $(Icons.arrow_back).tap();

      await $(Icons.arrow_back).tap();

      await $(Icons.star).tap();

      expect($('Meus Favoritos').exists, equals(true));

      for (var meal in mealsWithCategory) {
        expect($(meal.title).exists, equals(true));
        expect($("${meal.duration.toString()} min").exists, equals(true));
        expect($(meal.complexityText).exists, equals(true));
        expect($(meal.costText).exists, equals(true));
      }
  });

  patrolWidgetTest(
    'CT08-retirar_uma_receita_da_lista_de_favoritos_utilizando_o_icone_favorito',
    (PatrolTester $) async {
      await $.pumpWidgetAndSettle(const MyApp());

      Category category = categories.elementAt(0);

      expect($("Lista de Categorias").exists, equals(true));

      await $(category.title).tap();

      await $(InkWell).tap();

      await $(FloatingActionButton).tap();

      await $(Icons.arrow_back).tap();

      await $(Icons.arrow_back).tap();

      await $(Icons.star).tap();

      await $(InkWell).tap();

      await $(Icons.star).tap();

      await $(Icons.arrow_back).tap();

      expect($("Nenhuma refeição foi marcada como favoritas").exists, equals(true));
  });

  patrolWidgetTest(
    'CT09-verificar_a_exibição_dos_filtros',
    (PatrolTester $) async {
      await $.pumpWidgetAndSettle(const MyApp());

      await $(Icons.menu).tap();

      await $('Configurações').tap();
      
      expect($("Configurações").exists, equals(true));

      expect($("Filtros").exists, equals(true));

      expect($("Glutén").exists, equals(true));
      expect($("Só exibir refeições sem glúten!").exists, equals(true));

      var switchTileFinderGluten = $(#Gluten);
      var switchTileGluten = $.tester.widget<SwitchListTile>(switchTileFinderGluten);

      expect(switchTileGluten.value, false);

      expect($("Lactose").exists, equals(true));
      expect($("Só exibir refeições sem lactose!").exists, equals(true));

      var switchTileFinderLactose = $(#Lactose);
      var switchTileLactose = $.tester.widget<SwitchListTile>(switchTileFinderLactose);

      expect(switchTileLactose.value, false);

      expect($("Vegana").exists, equals(true));
      expect($("Só exibir refeições veganas!").exists, equals(true));

      var switchTileFinderVegana = $(#Vegana);
      var switchTileVegana = $.tester.widget<SwitchListTile>(switchTileFinderVegana);

      expect(switchTileVegana.value, false);

      expect($("Vegetariana").exists, equals(true));
      expect($("Só exibir refeições vegetarianas!").exists, equals(true));

      var switchTileFinderVegetariana = $(#Vegetariana);
      var switchTileVegetariana = $.tester.widget<SwitchListTile>(switchTileFinderVegetariana);

      expect(switchTileVegetariana.value, false);
        
  });

  patrolWidgetTest(
    'CT10-visualizando_apenas_receitas_relacionadas_ao_filtro_ativado',
    (PatrolTester $) async {
      await $.pumpWidgetAndSettle(const MyApp());

      Category category = categories.elementAt(0);

      final mealsWithCategory =
      dummyMeals.where((meal) => meal.categories.contains(category.id));

      expect($("Lista de Categorias").exists, equals(true));

      await $(category.title).tap();

      for (var meal in mealsWithCategory) {
        expect($(meal.title).exists, equals(true));
        expect($("${meal.duration.toString()} min").exists, equals(true));
        expect($(meal.complexityText).exists, equals(true));
        expect($(meal.costText).exists, equals(true));
      }

      await $(Icons.arrow_back).tap();

      expect($("Lista de Categorias").exists, equals(true));

      await $(Icons.menu).tap();

      await $(Icons.settings).tap();

      await $(#Gluten).tap();

      await $(Icons.menu).tap();

      await $(Icons.restaurant).tap();

      await $(category.title).tap();

      for (var meal in mealsWithCategory) {
        expect($(meal.title).exists, equals(false));
        expect($("${meal.duration.toString()} min").exists, equals(false));
        expect($(meal.complexityText).exists, equals(false));
        expect($(meal.costText).exists, equals(false));
      }
    },
  );
}
