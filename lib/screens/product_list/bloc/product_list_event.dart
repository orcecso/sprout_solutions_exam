part of 'product_list_bloc.dart';

abstract class ProductListEvent extends Equatable {
  @override
  List<Object?> get props => [];

  const ProductListEvent();
}

class ProductListInitialEvent extends ProductListEvent {
  @override
  List<Object?> get props => [];

  const ProductListInitialEvent();
}
