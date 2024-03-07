import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_class.freezed.dart';
part 'products_class.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required int id,
    required String? title,
    required String? description,
    required double? price,
    required double? discountPercentage,
    required double? rating,
    required int? stock,
    required String? brand,
    required String? category,
    required String? thumbnail,
    required List<String>? images,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
