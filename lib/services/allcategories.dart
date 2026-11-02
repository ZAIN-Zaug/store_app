import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/helper/api.dart';

class AllCategories {


  Future<List<dynamic>> getAllCategories() async {

      Api1 api = Api1();

      List<dynamic> data =await api.get(url: 'https://fakestoreapi.com/products/categories');
      return data;


}

}





