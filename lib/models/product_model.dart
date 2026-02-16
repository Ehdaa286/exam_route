class Product {
  final String title;  // استخدم title بدلاً من name
  final double price;
  final String image;
  final String description;
  final double rating;

  Product({
    required this.title,
    required this.price,
    required this.image,
    required this.description,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'],  // تأكد من أن المفتاح هنا هو title
      price: json['price'].toDouble(),
      image: json['image'],
      description: json['description'],
      rating: json['rating']['rate'].toDouble(),
    );
  }
}
