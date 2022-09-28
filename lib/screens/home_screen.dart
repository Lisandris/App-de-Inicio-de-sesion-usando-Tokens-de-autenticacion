import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:productos_apps/models/models.dart';
import 'package:productos_apps/screens/screens.dart';

import 'package:productos_apps/services/services.dart';
import 'package:productos_apps/widgets/widgets.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductsService>(context);

    if( productsService.isLoading) return LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
      ),
      body: ListView.builder(
        itemCount: productsService.products.length,
        itemBuilder: ( BuildContext context, int index ) => GestureDetector(
          onTap: () {
            
            productsService.selectedProduct = productsService.products[index].copy();
            Navigator.pushNamed(context, 'product');
          },
          child: ProductCard(
            product: productsService.products[index],
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.add_box ),
        onPressed: () {

          productsService.selectedProduct = new Product(
            available: false,
             name: '',
              price: 0
          );
          Navigator.pushNamed(context, 'product');
        },
      ),
   );
  }
}