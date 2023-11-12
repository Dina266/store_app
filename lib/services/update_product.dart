
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class UpdateProductService {

  Future<ProductModel> updateProduct ({required int id , required String title,required String desc ,required String category ,required String image ,required String price}) async {

    print('product id = $id');
    // ignore: missing_required_param

      Map<String , dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id', body: {
        'title' : title,
        'description' :desc ,
        'image' :image,
        'category':category,
        'price' :price
    });
      return ProductModel.fromJson(data);
  
  }
}

