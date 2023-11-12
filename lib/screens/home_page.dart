import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../services/get_all_products_services.dart';
import '../widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String routeName = 'homePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ))
          ],
          centerTitle: true,
          title: Text(
            'New Trend',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
          child: FutureBuilder<List<ProductModel>>(
            future: AllProductService().GetAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ProductModel> products = snapshot.data!;
                return GridView.builder(
                  itemCount: products.length,
                  clipBehavior: Clip.none,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 80),
                  itemBuilder: (context, index) {
                    return CustomCard(product: products[index],);
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }
}
