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
// Para agregar nuevos productos loadProducts
Future<List<Product>> loadProducts() async {

  this.isLoading = true;
  notifyListeners(); /* para notificar a cualquier widget que se esta cargando */

  final url = Uri.https( _baseUrl, 'products.json');
/* dispara la peticion y regresa como un body */
  final resp = await http.get( url );

  final Map<String, dynamic> productsMap = json.decode( resp.body );

  productsMap.forEach((key, value) {
    final tempProduct = Product.fromMap( value );
    tempProduct.id = key;
    this.products.add( tempProduct );
  });

  this.isLoading = false;
  notifyListeners();  
  // para llamar a loadproducts

  return this.products;

}

}