import 'package:http/http.dart' as http;
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product.dart';

class Addproduct {




Future<ProductModel> addProduct({
  required String title,
  required String price,
  required String description
  ,required String image,
  required String category}) async {
  Map <String,dynamic> data = await Api1().post(url:'https://fakestoreapi.com/products',
      body:{
        'title':title,
        'price':price,
        'description':description,
        'image':image,
        'category':category,

      } );
  return ProductModel.fromJson(data);


}


}