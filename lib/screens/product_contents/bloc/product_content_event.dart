part of 'product_content_bloc.dart';

abstract class ProductContentEvent extends Equatable {
  @override
  List<Object?> get props => [];

  const ProductContentEvent();
}

class ProductContentInitialEvent extends ProductContentEvent {
  final int productId;
  @override
  List<Object?> get props => [productId];

  const ProductContentInitialEvent(this.productId);
}
