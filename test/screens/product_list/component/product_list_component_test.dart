import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sprout_solutions_exam/screens/product_list/bloc/product_list_bloc.dart';
import 'package:sprout_solutions_exam/screens/product_list/components/product_list_component.dart';

void main() {
  group('ProductListComponent', () {
    late ProductListBloc productListBloc;

    setUp(() {
      productListBloc = ProductListBloc();
    });

    tearDown(() {
      productListBloc.close();
    });

    testWidgets('renders ProductListComponent', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProductListComponent(),
          ),
        ),
      );

      expect(find.byType(ProductListComponent), findsOneWidget);
    });

    testWidgets('renders CircularProgressIndicator when loading',
        (WidgetTester tester) async {
      productListBloc.emit(ProductListState.initial());

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider.value(
              value: productListBloc,
              child: const ProductListComponent(),
            ),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
