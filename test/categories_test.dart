import 'package:meals/main.dart';
import 'package:patrol_finders/patrol_finders.dart';

void main() {
  patrolWidgetTest(
    'counter is incremented when plus button is tapped',
    (PatrolTester $) async {
      await $.pumpWidget(const MyApp());
    },
  );
}
