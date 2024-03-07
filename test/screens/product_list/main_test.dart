import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sprout_solutions_exam/router.dart';
import 'package:sprout_solutions_exam/screens/product_list/components/product_list_component.dart';
import 'package:sprout_solutions_exam/router.gr.dart';

void main() {
  group('MainProductList', () {
    testWidgets('renders MainProductList', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp.router(
          routerDelegate: AutoRouterDelegate(AppRouter()),
          routeInformationParser: AppRouter().defaultRouteParser(),
        ),
      );

      expect(find.byType(MainProductList), findsOneWidget);
    });

    testWidgets('renders ProductListComponent', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp.router(
          routerDelegate: AutoRouterDelegate(AppRouter()),
          routeInformationParser: AppRouter().defaultRouteParser(),
        ),
      );

      expect(find.byType(ProductListComponent), findsOneWidget);
    });

    testWidgets('initializes ProductListBloc', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp.router(
          routerDelegate: AutoRouterDelegate(AppRouter()),
          routeInformationParser: AppRouter().defaultRouteParser(),
        ),
      );

      // final blocFinder = find.descendant(
      //   of: find.byType(MainProductList),
      //   matching: find.byType(BlocProvider<ProductListBloc>()),
      // );

      // expect(blocFinder, findsOneWidget);
    });
  });
}
