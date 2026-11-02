import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/models/product.dart';
import 'package:store_app/helper/api.dart';

class  ProductsByCategory{


  Future<List<ProductModel>> getProductsByCategory({required String categoryName}) async {

      Api1 api = Api1();

      List<dynamic> data = await api.get(url: 'https://fakestoreapi.com/products/category/$categoryName');



      List<ProductModel> productsList = [];

      for (int i = 0; i < data.length; i++) {
        productsList.add(ProductModel.fromJson(data[i]));
      }

      return productsList;


  }

}