import 'package:flutter/material.dart';

class InputDecorations{

  static InputDecoration authInputDecoration({
    
    required String hintText,
    required String labelText,
    IconData? prefixIcon
  }){
    return InputDecoration(
                enabledBorder:  UnderlineInputBorder(
                 borderSide: BorderSide(
                  color: Color.fromARGB(255, 201, 90, 182),
                   ),
                ),
                focusedBorder:  UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 155, 63, 127),
                    width: 2,
                  )
                ),
                hintText: hintText,
                labelText: labelText,
                labelStyle:  const TextStyle(
                  color: Colors.grey,
                ),
                prefixIcon: prefixIcon != null
                  ? Icon( prefixIcon,
                  color: const Color.fromARGB(255, 155, 63, 127) )
                  : null
                );

  }

}