import 'package:flutter_test/flutter_test.dart';
import 'package:sprout_solutions_exam/main.dart';
import 'package:sprout_solutions_exam/router.gr.dart';

void main() {
  testWidgets('MyHomePage widget test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Press here'), findsOneWidget);

    await tester.tap(find.text('Press here'));
    await tester.pumpAndSettle();

    expect(find.byType(MainProductList), findsOneWidget);
  });
}
