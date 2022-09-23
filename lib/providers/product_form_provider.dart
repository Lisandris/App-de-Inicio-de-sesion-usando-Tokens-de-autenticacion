import 'package:flutter/material.dart';
import 'package:productos_apps/models/product.dart';

class ProductFormProvider extends ChangeNotifier{

GlobalKey<FormState> formkey = new GlobalKey<FormState>();

Product product;

ProductFormProvider( this.product );


bool isValidForm() {

   return formkey.currentState?.validate() ?? false;
}

}