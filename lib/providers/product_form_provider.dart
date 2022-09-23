import 'package:flutter/material.dart';
import 'package:productos_apps/models/product.dart';

class ProductFormProvider extends ChangeNotifier{

GlobalKey<FormState> formkey = new GlobalKey<FormState>();

Product product;

ProductFormProvider( this.product );

updataAvailability ( bool value ){
  print(value);
  this.product.available = value;
  notifyListeners();
}


bool isValidForm() {

   return formkey.currentState?.validate() ?? false;
}

}