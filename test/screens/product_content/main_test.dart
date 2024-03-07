import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sprout_solutions_exam/screens/product_contents/bloc/product_content_bloc.dart';
import 'package:sprout_solutions_exam/screens/product_contents/components/product_content_component.dart';
import 'package:sprout_solutions_exam/screens/product_contents/main.dart';

class MockProductContentBloc extends Mock implements ProductContentBloc {}

void main() {
  group('MainProductContents', () {
    late MockProductContentBloc productContentBloc;

    setUp(() {
      productContentBloc = MockProductContentBloc();
    });

    testWidgets('provides ProductContentBloc to ProductContentComponent',
        (WidgetTester tester) async {
      const productId = 1;

      await tester.pumpWidget(
        MaterialApp(
          home: const MainProductContents(productId: productId),
          builder: (context, child) {
            return BlocProvider<ProductContentBloc>(
              create: (context) => productContentBloc,
              child: child!,
            );
          },
        ),
      );

      final productContentComponentFinder =
          find.byType(ProductContentComponent);

      expect(productContentComponentFinder, findsOneWidget);

      final productContentComponent =
          tester.widget<ProductContentComponent>(productContentComponentFinder);

      expect(productContentComponent.productId, productId);
    });
  });
}
