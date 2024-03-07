import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sprout_solutions_exam/widgets/sprout_scaffold.dart';

void main() {
  testWidgets('SproutScaffold should build correctly',
      (WidgetTester tester) async {
    final Widget child = Container();

    await tester.pumpWidget(
      MaterialApp(
        home: DefaultSproutScaffold(
          appBar: AppBar(title: const Text('Test')),
          systemUiOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: Colors.white,
          child: child,
        ),
      ),
    );

    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byWidget(child), findsOneWidget);
  });

  testWidgets('DefaultSproutScaffold should build correctly',
      (WidgetTester tester) async {
    final Widget child = Container();
    await tester.pumpWidget(
      MaterialApp(
        home: DefaultSproutScaffold(
          appBar: AppBar(title: const Text('Test')),
          systemUiOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: Colors.white,
          child: child,
        ),
      ),
    );

    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byWidget(child), findsOneWidget);
  });
}
