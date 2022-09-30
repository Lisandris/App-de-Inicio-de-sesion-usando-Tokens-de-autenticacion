import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;




class AuthService extends ChangeNotifier {

  final String _baseurl ='identitytoolkit.googleapis.com';
  final String _firebaseToken ='AIzaSyCZD-5tiwEZ6DGG7Fl8XHEKbqvs7aZ69Ns';

  Future<String?> createUser( String email, String password ) async{

    final Map<String, dynamic> authData = {
      'email': email,
      'password': password
    };

    final url = Uri.https(_baseurl, '/v1/accounts:signUp', {
      'key': _firebaseToken
   });

   final resp = await http.post(url, body: json.encode(authData));
   final Map<String, dynamic> decodedResp = json.decode( resp.body );

   

  }
  


 
}