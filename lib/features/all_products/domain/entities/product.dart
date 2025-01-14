class Product {
  final int id;
  final String name;
  final double price;
  bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.price,
    this.isFavorite = false,
  });

  Product copyWith({
    int? id,
    String? name,
    double? price,
    bool? isFavorite,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        price = json['price'].toDouble(),
        isFavorite = json['isFavorite'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'isFavorite': isFavorite,
    };
  }
}
