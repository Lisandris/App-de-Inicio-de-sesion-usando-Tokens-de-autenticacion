import 'package:flutter/material.dart';


// Clase para manejar el formulario
class LoginFormProvider extends ChangeNotifier {

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String email    = '';
  String password = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  
  set isLoading( bool value ) {
    _isLoading = value;
    notifyListeners();
  }

 bool isValidForm() {

  print('lisa: formKey.currentState?.validate()');

  print('$email - $password');

  return formKey.currentState?.validate() ?? false;
 }


  
}