part of 'product_list_bloc.dart';

enum ProductListStatus {
  initial,
  loading,
  success;

  bool get isInitial => this == initial;
  bool get isLoading => this == loading;
  bool get isSuccess => this == success;
}

class ProductListState extends Equatable {
  final ProductListStatus status;

  final List<Product> products;
  final int total;
  final int skip;
  final int limit;

  const ProductListState({
    required this.status,
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductListState.initial() {
    return const ProductListState(
      status: ProductListStatus.initial,
      products: [],
      total: 0,
      skip: 0,
      limit: 10,
    );
  }

  ProductListState copyWith({
    ProductListStatus? status,
    List<Product>? products,
    int? total,
    int? skip,
    int? limit,
  }) {
    return ProductListState(
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
