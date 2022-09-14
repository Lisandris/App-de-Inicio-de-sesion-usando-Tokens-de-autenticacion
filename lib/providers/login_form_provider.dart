import 'package:flutter/material.dart';


// Clase para manejar el formulario
class LoginFormProvider extends ChangeNotifier {

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String email    = '';
  String password = '';


 bool isValidForm() {

  print('lisa: formKey.currentState?.validate()');

  print('$email - $password');

  return formKey.currentState?.validate() ?? false;
 }


  
}