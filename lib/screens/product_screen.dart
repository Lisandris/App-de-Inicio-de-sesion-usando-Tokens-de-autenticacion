import 'package:flutter/material.dart';
import 'package:productos_apps/ui/input_decorations.dart';
import 'package:productos_apps/widgets/widgets.dart';


class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            Stack(  /* Todo esto esta en la seccion de la tarjeta */
              children: [
                ProductImage(),
                Positioned(
                  top: 60,
                  left: 20,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(), 
                    icon: const Icon( Icons.arrow_back_ios_new_rounded, size: 40, color: Colors.white ),
                  )
                ),

                Positioned(
                  top: 60,
                  right: 20,
                  child: IconButton(
                    onPressed: () {
                      // TODO: camara o galeria
                    },
                    icon: const Icon( Icons.camera_alt_outlined, size: 40, color: Colors.white ),
                  )
                )
              ],
            ),

            _ProductForm(),

            SizedBox( height: 100),

          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon ( Icons.save_outlined ),
        onPressed: () {
          // TODO: guardar roducto
        },
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10 ),
      child: Container(
         padding: EdgeInsets.symmetric(horizontal: 20 ),
         width: double.infinity,
         decoration: _buildBoxDecoration(),
         child: Form(
          child: Column(
            children: [

              SizedBox( height: 10 ),

              TextField(
                decoration : InputDecorations.authInputDecoration(
                  hintText : 'Nombre del producto',
                  labelText: 'Nombre:', 
                  
                ),
              ),

              const SizedBox( height: 30 ),

              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecorations.authInputDecoration(
                  hintText:'\$150',
                  labelText: 'Precio', 
                ), 
              ),


              SizedBox( height: 30 ),

              SwitchListTile.adaptive(
                value: true, 
                title: Text('Disponible'),
                activeColor: Colors.pink[400],
                onChanged: ( value) {
                  // TODO:pendiente
                }
              ),
              SizedBox( height: 30 ),

            ],
          )
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.only( bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25) ),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 5,
      )
    ]
  );
}
