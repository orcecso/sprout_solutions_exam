part of 'product_content_bloc.dart';

enum ProductContentStatus {
  initial,
  loading,
  success;

  bool get isInitial => this == initial;
  bool get isLoading => this == loading;
  bool get isSuccess => this == success;
}

class ProductContentState extends Equatable {
  final ProductContentStatus status;

  final Product? products;
  final int total;
  final int skip;
  final int limit;

  const ProductContentState({
    required this.status,
    this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductContentState.initial() {
    return const ProductContentState(
      status: ProductContentStatus.initial,
      products: null,
      total: 0,
      skip: 0,
      limit: 10,
    );
  }

  ProductContentState copyWith({
    ProductContentStatus? status,
    Product? products,
    int? total,
    int? skip,
    int? limit,
  }) {
    return ProductContentState(
      status: status ?? this.status,
      products: products ?? this.products,
      total: total ?? this.total,
      skip: skip ?? this.skip,
      limit: limit ?? this.limit,
    );
  }

  @override
  List<Object?> get props => [products, total, skip, limit];
}
