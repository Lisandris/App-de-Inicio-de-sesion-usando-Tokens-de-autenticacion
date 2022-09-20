import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:productos_apps/models/product.dart';
import 'package:http/http.dart' as http;


class ProductsService extends ChangeNotifier{

final String _baseUrl = 'flutter-varios-91ade-default-rtdb.firebaseio.com';
final List<Product> products = [];
bool isLoading = true;

ProductsService() {
  this.loadProducts();

}

Future loadProducts() async {

  final url = Uri.https( _baseUrl, 'products.json');
/* dispara la peticion y regresa como un body */
  final resp = await http.get( url );

  final Map<String, dynamic> productsMap = json.decode( resp.body );

  productsMap.forEach((key, value) {
    final tempProduct = Product.fromMap( value );
    tempProduct.id = key;
    this.products.add( tempProduct );
    
  });

  print( this.products[0].name );

}

}