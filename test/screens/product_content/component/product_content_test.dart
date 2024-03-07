import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sprout_solutions_exam/models/products_class.dart';
import 'package:sprout_solutions_exam/screens/product_contents/bloc/product_content_bloc.dart';
import 'package:sprout_solutions_exam/screens/product_contents/components/product_content_component.dart';

class MockProductContentBloc implements ProductContentBloc {
  @override
  void add(ProductContentEvent event) {
    // TODO: implement add
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    // TODO: implement addError
  }

  @override
  Future<void> close() {
    // TODO: implement close
    throw UnimplementedError();
  }

  @override
  void emit(ProductContentState state) {
    // TODO: implement emit
  }

  @override
  // TODO: implement isClosed
  bool get isClosed => throw UnimplementedError();

  @override
  void on<E extends ProductContentEvent>(
      EventHandler<E, ProductContentState> handler,
      {EventTransformer<E>? transformer}) {
    // TODO: implement on
  }

  @override
  void onChange(Change<ProductContentState> change) {
    // TODO: implement onChange
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(ProductContentEvent event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(
      Transition<ProductContentEvent, ProductContentState> transition) {
    // TODO: implement onTransition
  }

  @override
  // TODO: implement state
  ProductContentState get state => throw UnimplementedError();

  @override
  // TODO: implement stream
  Stream<ProductContentState> get stream => throw UnimplementedError();
}

void main() {
  group('ProductContentComponent', () {
    late MockProductContentBloc productContentBloc;

    setUp(() {
      productContentBloc = MockProductContentBloc();
    });

    testWidgets('renders loading indicator when state is loading',
        (WidgetTester tester) async {
      when(productContentBloc.stream).thenAnswer((_) => Stream.fromIterable([
            const ProductContentState(
                status: ProductContentStatus.loading,
                total: 10,
                skip: 0,
                limit: 10)
          ]));

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: productContentBloc,
            child: const ProductContentComponent(productId: 1),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders product details when state is success',
        (WidgetTester tester) async {
      const product = Product(
        id: 1,
        title: 'Test Product',
        price: 100,
        discountPercentage: 10,
        rating: 4.5,
        stock: 10,
        brand: 'Test Brand',
        category: 'Test Category',
        description: 'Test Description',
        thumbnail: 'thumbnail.jpg',
        images: ['image1.jpg', 'image2.jpg'],
      );

      when(productContentBloc.stream).thenAnswer((_) => Stream.fromIterable([
            const ProductContentState(
                status: ProductContentStatus.success,
                products: product,
                total: 10,
                skip: 10,
                limit: 10)
          ]));

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: productContentBloc,
            child: const ProductContentComponent(productId: 1),
          ),
        ),
      );

      expect(find.text(product.title!), findsOneWidget);
      expect(find.text('Price: \$${product.price.toString()}'), findsOneWidget);
      expect(find.text('Discount: ${product.discountPercentage.toString()}%'),
          findsOneWidget);
      expect(find.text('Rating: ${product.rating.toString()}'), findsOneWidget);
      expect(find.text('Stock: ${product.stock.toString()}'), findsOneWidget);
      expect(find.text('Brand: ${product.brand ?? ''}'), findsOneWidget);
      expect(find.text('Category: ${product.category ?? ''}'), findsOneWidget);
      expect(find.text('Description:'), findsOneWidget);
      expect(find.text(product.description!), findsOneWidget);
      expect(find.text('Images:'), findsOneWidget);
      expect(find.byType(Image), findsNWidgets(product.images!.length));
    });
  });
}
