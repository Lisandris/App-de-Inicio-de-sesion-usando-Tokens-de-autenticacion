import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;


class AuthService extends ChangeNotifier {

  final String _baseurl ='identitytoolkit.googleapis.com';
  final String _firebaseToken ='AIzaSyCZD-5tiwEZ6DGG7Fl8XHEKbqvs7aZ69Ns';

  final storage = new FlutterSecureStorage();

  // si retornamos algo es un error
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

   if (decodedResp.containsKey('idToken')) {
    // token hay que guardar en lugar seguro
    await storage.write(key: 'token', value: decodedResp[ 'idToken'] );
      return null;
   } else{
    return decodedResp['error']['message'];
   }


  }


  Future<String?> login( String email, String password ) async{

    final Map<String, dynamic> authData = {
      'email': email,
      'password': password
    };

    final url = Uri.https(_baseurl, '/v1/accounts:signInWithPassword', {
      'key': _firebaseToken
   });

   final resp = await http.post(url, body: json.encode(authData));
   final Map<String, dynamic> decodedResp = json.decode( resp.body );

   if (decodedResp.containsKey('idToken') ) {
      // token hay que guardar en lugar seguro
     // decodedResp['idToken'];
     await storage.write(key: 'token', value: decodedResp['idToken']);
      
      return null;
   } else{
    return decodedResp['error']['message'];
   }

  }
  


  Future logout()async{
  await storage.delete(key: 'token' );

  return;
  }


 
}