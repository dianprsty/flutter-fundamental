// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  String? sku;
  int? weight;
  String? availabilityStatus;
  int? minimumOrderQuantity;
  String? thumbnail;
  ProductModel({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.sku,
    this.weight,
    this.availabilityStatus,
    this.minimumOrderQuantity,
    this.thumbnail,
  });

  ProductModel copyWith({
    int? id,
    String? title,
    String? description,
    String? category,
    double? price,
    double? discountPercentage,
    double? rating,
    int? stock,
    String? brand,
    String? sku,
    int? weight,
    String? availabilityStatus,
    int? minimumOrderQuantity,
    String? thumbnail,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      price: price ?? this.price,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      rating: rating ?? this.rating,
      stock: stock ?? this.stock,
      brand: brand ?? this.brand,
      sku: sku ?? this.sku,
      weight: weight ?? this.weight,
      availabilityStatus: availabilityStatus ?? this.availabilityStatus,
      minimumOrderQuantity: minimumOrderQuantity ?? this.minimumOrderQuantity,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'brand': brand,
      'sku': sku,
      'weight': weight,
      'availabilityStatus': availabilityStatus,
      'minimumOrderQuantity': minimumOrderQuantity,
      'thumbnail': thumbnail,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      price: map['price'] != null ? map['price'] as double : null,
      discountPercentage: (map['discountPercentage']).toDouble(),
      rating: map['rating'] != null ? map['rating'] as double : null,
      stock: map['stock'] != null ? map['stock'] as int : null,
      brand: map['brand'] != null ? map['brand'] as String : null,
      sku: map['sku'] != null ? map['sku'] as String : null,
      weight: map['weight'] != null ? map['weight'] as int : null,
      availabilityStatus: map['availabilityStatus'] != null
          ? map['availabilityStatus'] as String
          : null,
      minimumOrderQuantity: map['minimumOrderQuantity'] != null
          ? map['minimumOrderQuantity'] as int
          : null,
      thumbnail: map['thumbnail'] != null ? map['thumbnail'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(id: $id, title: $title, description: $description, category: $category, price: $price, discountPercentage: $discountPercentage, rating: $rating, stock: $stock, brand: $brand, sku: $sku, weight: $weight, availabilityStatus: $availabilityStatus, minimumOrderQuantity: $minimumOrderQuantity, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.category == category &&
        other.price == price &&
        other.discountPercentage == discountPercentage &&
        other.rating == rating &&
        other.stock == stock &&
        other.brand == brand &&
        other.sku == sku &&
        other.weight == weight &&
        other.availabilityStatus == availabilityStatus &&
        other.minimumOrderQuantity == minimumOrderQuantity &&
        other.thumbnail == thumbnail;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        category.hashCode ^
        price.hashCode ^
        discountPercentage.hashCode ^
        rating.hashCode ^
        stock.hashCode ^
        brand.hashCode ^
        sku.hashCode ^
        weight.hashCode ^
        availabilityStatus.hashCode ^
        minimumOrderQuantity.hashCode ^
        thumbnail.hashCode;
  }
}
