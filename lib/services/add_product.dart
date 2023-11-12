
// ignore_for_file: missing_required_param

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AddProduct {
String url ='https://fakestoreapi.com/products';

  Future<ProductModel> addProduct ({required String title,required String desc ,required String category ,required String image ,required String price}) async {

    http.Response response = await Api().post(
      url: url, body: {
        'title' : title,
        'description' :desc ,
        'image' :image,
        'category':category,
        'price' :price
        
    });


    if (response.statusCode == 200) {
      Map<String , dynamic> data = jsonDecode(response.body);
      return ProductModel.fromJson(data);
    }
    else {
      throw Exception('there is problem in status code ${response.statusCode} with body ${response.body}');
    }
  }
}