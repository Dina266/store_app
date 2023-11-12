class ProductModel {
  final int id;
  final String price;
  final String description;
  final String title;
  final String image;
  final String category;
  // final RatingModel? rating;

  ProductModel({
    required this.id,
    required this.description,
    required this.image,
    required this.title,
    required this.price,
    // required this.rating,
    required this.category
  });

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      description: jsonData['description'],
      image: jsonData['image'],
      title: jsonData['title'],
      category: jsonData['category'],
      price: jsonData['price'].toString(),
      // rating: RatingModel.fromJson(jsonData['rating'])
    );
  }

}

// class RatingModel {

//   final String rate;
//   final int count;


//   RatingModel({required this.rate , required this.count});

//   factory RatingModel.fromJson (jsonData) {

//     return RatingModel(rate: jsonData['rate'].toString(), count: jsonData['count']);
//   }
// }
