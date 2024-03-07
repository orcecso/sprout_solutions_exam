import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sprout_solutions_exam/router.dart';
import 'package:sprout_solutions_exam/router.gr.dart';

final routes = [
  AutoRoute(page: MyHomeRoute.page, initial: true),
  AutoRoute(page: MainProductList.page),
  AutoRoute(page: MainProductContents.page),
];

void main() {
  testWidgets('MyApp should build and show MaterialApp',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(MaterialApp), findsOneWidget);
  });

  testWidgets('MyApp should use AppRouter', (WidgetTester tester) async {
    final mockAppRouter = MockAppRouter();

    await tester.pumpWidget(MyApp(appRouter: mockAppRouter));

    verify(mockAppRouter.config).called(1);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.appRouter});

  final AppRouter? appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: appRouter!.delegate(),
      routeInformationParser: appRouter!.defaultRouteParser(),
    );
  }
}

class MockAppRouter extends Mock implements AppRouter {}
