import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sprout_solutions_exam/models/products_class.dart';
import 'package:sprout_solutions_exam/repositories/server.dart';

part 'product_content_event.dart';
part 'product_content_state.dart';

class ProductContentBloc
    extends Bloc<ProductContentEvent, ProductContentState> {
  ProductContentBloc() : super(ProductContentState.initial()) {
    on<ProductContentEvent>(_onInit);
    on<ProductContentInitialEvent>(_onFetch);
  }

  Future<void> _onInit(
    ProductContentEvent event,
    Emitter<ProductContentState> emit,
  ) async {
    emit(const ProductContentState(
        status: ProductContentStatus.loading,
        products: null,
        total: 0,
        skip: 0,
        limit: 10));
  }

  Future<void> _onFetch(
    ProductContentInitialEvent event,
    Emitter<ProductContentState> emit,
  ) async {
    emit(const ProductContentState(
        status: ProductContentStatus.loading,
        products: null,
        total: 0,
        skip: 0,
        limit: 10));
    Product product = await fetchContents(event.productId);

    emit(state.copyWith(
        products: product, status: ProductContentStatus.success));
  }
}
