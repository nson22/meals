import 'package:flutter_test/flutter_test.dart';
import 'package:meals/main.dart';
import 'package:patrol_finders/patrol_finders.dart';

void main() {
  patrolWidgetTest(
    'Verificar a exibição correta das categorias',
    (PatrolTester $) async {
      await $.pumpWidget(const MyApp());
      // expect($("Vamos conzinhar?").exists, equals(true));
      expect($("Lista de Categorias").exists, equals(true));
      expect($("Italiano").exists, equals(true));
      expect($("Rápido & Fácil").exists, equals(true));
      expect($("Hamburgers").exists, equals(true));
    },
  );

  // patrolWidgetTest('Selecionar uma categoria',
  //   (PatrolTester $) async {
  //     await $.pumpWidget(const MyApp());
  //   },
  // );

  // patrolWidgetTest('Verificar a presença dos ícones Categorias e Favoritos',
  //   (PatrolTester $) async {
  //     await $.pumpWidget(const MyApp());
  //   },
  // );

  // patrolWidgetTest('Verificar se a tela de categorias é exibida quando o usuário seleciona o ícone de “Categorias”',
  //   (PatrolTester $) async {
  //     await $.pumpWidget(const MyApp());
  //   },
  // );
}
