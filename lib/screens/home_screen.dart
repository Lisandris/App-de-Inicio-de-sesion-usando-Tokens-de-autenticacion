import 'package:flutter/material.dart';
import 'package:productos_apps/services/products_service.dart';
import 'package:productos_apps/widgets/widgets.dart';

import 'package:productos_apps/widgets/widgets.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductsService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: ( BuildContext context, int index ) => GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'product'),
          child: ProductCard(),
          )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.add_box ),
        onPressed: () {},
      ),
   );
  }
}