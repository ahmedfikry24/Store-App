class ProductModel {
  final int id;
  final double price;
  final String title;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;

  ProductModel(
      {required this.id,
      required this.price,
      required this.description,
      required this.title,
      required this.category,
      required this.image,
      required this.rating});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        price: json['price'],
        title: json['title'],
        description: json['description'],
        category: json['category'],
        image: json['image'],
        rating: RatingModel.fromJson(json['rating']));
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      rate: json['rate'],
      count: json['count'],
    );
  }
}
