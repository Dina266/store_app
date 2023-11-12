// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});

  static String routeName = 'updateProduct';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? title, desc, image, price, productName;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Update Product',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 100,
              ),
              CustomTextFormField(
                onChanged: (data) {
                  productName = data;
                },
                hintText: 'Product Name',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                hintText: 'description',
                onChanged: (data) {
                  desc = data;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                onChanged: (data) {
                  price = data.toString();
                },
                hintText: 'price',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                onChanged: (data) {
                  image = data;
                },
                hintText: 'image',
              ),
              const SizedBox(
                height: 50,
              ),
              CustomButtom(
                title: 'Update',
                onTap: () async {
                  isLoading = true;
                  setState(() {});
                    await updateProduct(product);
                  try {
                    print('success');
                  } catch (e) {
                    print(e.toString());
                  }

                  isLoading = false;
                  setState(() {});
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
        id: product.id,
        title: productName == null ? product.title : productName!,
        desc: desc == null ? product.description : desc!,
        category: product.category,
        image: image == null ? product.image : image!,
        price: price == null ? product.price : price!);
  }
}
