
class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final double rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Product.fromDynamic(dynamic map) => Product(
        id: map['id'],
        title: map['title'],
        image: map['image'],
        price: map['price'].toDouble(),
        description: map['description'],
        category: map['category'],
        rating: map['rating']['rate'].toDouble(),
      );

  static List<Product> fromDynamicList(dynamic list) {
    final result = <Product>[];

    if (list != null) {
      for (dynamic map in list) {
        result.add(Product.fromDynamic(map));
      }
    }

    return result;
  }
}