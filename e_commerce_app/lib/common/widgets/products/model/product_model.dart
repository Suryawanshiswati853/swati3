class ProductModel {
  final String id;
  final String title;
  final String brand;
  final String imageUrl;
  final double price;
  final String discount;
  final bool isFav;

  ProductModel({
    required this.id,
    required this.title,
    required this.brand,
    required this.imageUrl,
    required this.price,
    this.discount = "0%",
    this.isFav = false,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      title: json["title"],
      brand: json["brand"],
      imageUrl: json["imageUrl"],
      price: (json["price"] as num).toDouble(),
      discount: json["discount"] ?? "0%",
      isFav: json["isFav"] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "brand": brand,
      "imageUrl": imageUrl,
      "price": price,
      "discount": discount,
      "isFav": isFav,
    };
  }
}
