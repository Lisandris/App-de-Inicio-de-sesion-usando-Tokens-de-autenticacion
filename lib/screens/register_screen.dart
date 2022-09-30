import 'package:flutter/material.dart';
import 'package:productos_apps/providers/login_form_provider.dart';
import 'package:provider/provider.dart';

import 'package:productos_apps/ui/input_decorations.dart';
import 'package:productos_apps/widgets/widgets.dart';


class ResgiterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [

              const SizedBox( height: 250),

              CardContainer(
                child: Column(
                  children: [

                    SizedBox( height: 10 ),
                    Text('Crear cuenta', style: Theme.of(context).textTheme.headline5),
                    SizedBox( height: 30 ),

                    ChangeNotifierProvider(
                      create: ( _ ) => LoginFormProvider(),
                      child: _LoginForm()
                    )
                  ],
                ),
              ),

              SizedBox( height: 50 ),
              TextButton(
                onPressed: () => Navigator.pushReplacementNamed(context, 'login') ,
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.pink.withOpacity(0.1)),
                  shape: MaterialStateProperty.all( StadiumBorder())
                ),
                child: const Text('¿Ya tienes una cuenta?', style:TextStyle( fontSize:20, color: Colors.black87 ),),
              ),
              SizedBox( height: 50 ),
            ],
          ),
        )
      )
    );
  }
}

class _LoginForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

      final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        
          /* para validar el email */
        child: Column(
          children:  [

            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'example@gmail.com',
                labelText: 'Correo electronico',
                prefixIcon: Icons.alternate_email_rounded,
              ),
              onChanged: (value ) => loginForm.email = value,
              // Validacion del correo
              validator: ( value ) {

                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp  = new RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                  ? null
                  : 'Correo invalido';
              }, 
            ),

             const SizedBox( height: 30 ),

            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: '******',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_outline_rounded,
              ),
              onChanged: (value ) => loginForm.password = value,
              // Validacion de contraseña
              validator: ( value ) {
                
                return  ( value != null && value.length >= 6 ) 
                ? null
                : 'La contraseña debe tener minimo 6 caracteres';

              }, 
            ),

             const SizedBox( height: 30 ),

            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Color.fromARGB(255, 201, 90, 182),
              child: Container(
                padding: EdgeInsets.symmetric( horizontal: 70, vertical: 15),
                child: Text('Ingresar',
                 style: TextStyle ( color: Colors.white ),
                 ),
              ),
              onPressed: (){
                // TODO: Login form 
                if ( !loginForm.isValidForm() ) return;

                // Para pasar a la siguiente pantalla al press el boton
                Navigator.pushReplacementNamed(context, 'home');
              }
            )
            
          ],
        ),
      ),
    );
  }
}