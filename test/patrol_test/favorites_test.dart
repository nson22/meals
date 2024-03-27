import 'package:meals/main.dart';
import 'package:patrol_finders/patrol_finders.dart';

void main() {
  patrolWidgetTest('Verificar a exibição correta das receitas favoritas',
        (PatrolTester $) async {
      await $.pumpWidget(const MyApp());
    },
  );

  patrolWidgetTest('Verificar a lista de favoritos',
        (PatrolTester $) async {
      await $.pumpWidget(const MyApp());
    },
  );

  patrolWidgetTest('Favoritar receitas',
        (PatrolTester $) async {
      await $.pumpWidget(const MyApp());
    },
  );

  patrolWidgetTest('elecionar uma receita favorita',
        (PatrolTester $) async {
      await $.pumpWidget(const MyApp());
    },
  );
}
