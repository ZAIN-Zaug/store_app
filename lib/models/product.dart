class ProductModel{
  final int id;
  final String title;
  final String price;
  final String category;
  final String description;
  final RatingModel ? rating;
  final String image;

  ProductModel({
    required this.id
    ,required this.title,
    required this.price,
    required this.category,
    this.rating,
    required this.description,
    required this.image});

  factory ProductModel.fromJson(JsonData){
    return ProductModel(
        id :JsonData['id'],
        title: JsonData['title'],
        price: JsonData['price'].toString(),
        category: JsonData['category'],
        rating: RatingModel.fromJson(JsonData['rating']),
        description: JsonData['description'],
        image: JsonData['image']);
  }
}



class RatingModel{
  final String ? rate ;
  final int  ? count;

  RatingModel({ this.rate, this.count});

  factory RatingModel.fromJson(JsonData){

      return RatingModel(rate: JsonData== null ? null : JsonData['rate'].toString(),count:JsonData== null ? null : JsonData['count']);

  }
}

