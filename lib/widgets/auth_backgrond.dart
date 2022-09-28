import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  
    final Widget child;

    const AuthBackground({
      Key? key,
      required this.child
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color.fromARGB(255, 233, 200, 200),
      width: double.infinity,
      height: double.infinity,
      child: Stack( 
        children:  [
          
          _PinkBox(),
          // Icono de persona 
          _HeaderIcon(),

          this.child,
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        child: const Icon( Icons.person_pin_circle_outlined, color: Colors.white, size: 100 ),
      ),
    );
  }
}

class _PinkBox extends StatelessWidget {
  const _PinkBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _purpleBackground(),
      child: Stack(
        children: const [
          // posiciones de los circulos
          Positioned(child: _Bubble(), top: 130, left: 40, ),
          Positioned(child: _Bubble(), top: -40, left: 30, ),
          Positioned(child: _Bubble(), top: 70, left: 300, ),
          Positioned(child: _Bubble(), bottom: -50, left: 90, ),
          Positioned(child: _Bubble(), top: 300, right: 20, ),
         
        ],
      ),
    );
  }

  BoxDecoration _purpleBackground() => BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromARGB(255, 201, 90, 182),
        Color.fromARGB(255, 155, 63, 127),
      ]
    )
  );
}

class _Bubble extends StatelessWidget {
  const _Bubble({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  //  Circulos
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(255, 255, 266, 0.05)
        ),
    );
  }
}