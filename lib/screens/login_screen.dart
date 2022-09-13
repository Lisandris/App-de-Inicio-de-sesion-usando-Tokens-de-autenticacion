import 'package:flutter/material.dart';
import 'package:productos_apps/ui/input_decorations.dart';
import 'package:productos_apps/widgets/widgets.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox( height: 250),

              CardContainer(
                child: Column(
                  children: [

                    SizedBox( height: 10 ),
                    Text('Login', style: Theme.of(context).textTheme.headline5),
                    SizedBox( height: 30 ),

                    _LogibForm(),
                  ],
                ),
              ),

              SizedBox( height: 50 ),
              Text('Crear nueva cuenta', style:TextStyle( fontSize:20, fontWeight: FontWeight.bold ), ),
              SizedBox( height: 50 ),
            ],
          ),
        )
      )
    );
  }
}

class _LogibForm extends StatelessWidget {
  const _LogibForm
  ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        // TODO: mantener la ref al KEY
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
            ),

             SizedBox( height: 30 ),

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
              }
              )
            
          ],
        ),
      ),
    );
  }
}