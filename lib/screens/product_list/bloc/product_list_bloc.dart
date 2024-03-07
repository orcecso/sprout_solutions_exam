import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sprout_solutions_exam/models/products_class.dart';
import 'package:sprout_solutions_exam/repositories/server.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  ProductListBloc() : super(ProductListState.initial()) {
    on<ProductListEvent>(_onInit);
    on<NextProductList>(_onNextPage);
  }

  Future<void> _onInit(
    ProductListEvent event,
    Emitter<ProductListState> emit,
  ) async {
    emit(const ProductListState(
        status: ProductListStatus.loading,
        products: [],
        total: 0,
        skip: 0,
        limit: 10));
    List<Product> products = await fetchProducts();

    if (products.isEmpty) {
      emit(ProductListState.initial());
      return;
    }
    emit(state.copyWith(products: products, status: ProductListStatus.success));
  }

  Future<void> _onNextPage(
    NextProductList event,
    Emitter<ProductListState> emit,
  ) async {
    emit(const ProductListState(
        status: ProductListStatus.loading,
        products: [],
        total: 0,
        skip: 0,
        limit: 10));

    List<Product> products = await nextPage(event.pageNum);

    if (products.isEmpty) {
      emit(ProductListState.initial());
      return;
    }
    emit(state.copyWith(products: products, status: ProductListStatus.success));
  }
}
