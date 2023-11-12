
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/update_product_page.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    required this.product,
    super.key,
  });

  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, UpdateProductPage.routeName , arguments: product),
      child: Stack(
        clipBehavior: Clip.none,
        children: [Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 40,
                spreadRadius: 0,
                offset: Offset(10,10),
                color: Colors.grey[300]!
              )
            ]
          ),
          child: Card(
              
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16 , vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.title.substring(0,11) , style: TextStyle(color: Colors.grey , fontSize: 16),),
                  SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    
                    children: [
                    Text(r'$' '${product.price}' , style: TextStyle(color: Colors.black ),),
                    Icon(Icons.favorite , color: Colors.red,)
                    ],
                  )
                  
                ],
              ),
            ),
          ),
        ),
    
        Positioned(
          right: 30,
          top: -65,
          child: Image.network(product.image , height: 100,width: 100,),)
        
        ]
      ),
    );
  }
}